<?php
namespace App\Traits;

use App\Support\Http as HttpErrors;

class API
{
    private $message;
    private $data;
    private $count;
    private $errors;
    private $status;
    private $attributes;
    private $formatErrors = false;
    static private $instance = null;


    static function newInstance() {
        if (static::$instance === null) {
            static::$instance = new API();
        }
        return static::$instance;
    }

    function addAttribute(string $attribute, $data) {
        $this->attributes[$attribute] = $data;
        return $this;
    }

    function getAttributes() {
        return $this->attributes ?? [];
    }

    function setStatusErrorConditional() {
        if (!is_array($this->errors)) {
            throw new \Exception("Errors array is empty, set it at first.");
        }
        if (count($this->errors)) {
            $this->setStatusError();
        } else {
            $this->setStatusOK();
        }
        return $this;
    }

    function setStatus(int $status) {
        $this->status = $status;
        return $this;
    }

    function setStatusOK() {
        $this->setStatus(HttpErrors::OK);
        return $this;
    }

    function setStatusError() {
        $this->setStatus(HttpErrors::BadRequest);
        return $this;
    }

    function setStatusUnauthorized() {
        $this->setStatus(HttpErrors::Unauthorized);
        return $this;
    }

    function isOk($message = '') {
        $this->setStatus(HttpErrors::OK);
        $this->setMessage($message);
        return $this;
    }

    function isCreated($message = '') {
        $this->setStatus(HttpErrors::Created);
        $this->setMessage($message);
        return $this;
    }

    function isError($message = '') {
        $this->setStatus(HttpErrors::BadRequest);
        $this->setMessage($message);
        return $this;
    }

    function isVerifiedPayment($message = '') {
        $this->setStatus(HttpErrors::UnauthorizedPayment);
        $this->setMessage($message);
        return $this;
    }

    function getStatus() {
        return $this->status;
    }

    function setMessage(string $message) {
        $this->message = $message;
        return $this;
    }

    function getMessage() {
        return $this->message ?? '';
    }

    function setData($data) {
        $this->data = $data;
        return $this;
    }

    function setPagesCount($count) {
        $this->count = $count;
        return $this;
    }

    function getData() {
        return $this->data ?? [];
    }

    function getPagesCount() {
        return $this->count > 0 ? $this->count : 1;
    }

    function setErrors(array $errors) {
        $this->errors = $errors;
        return $this;
    }

    function getErrors() {
        $errors = $this->errors ?? [];
        $fullErrors = [];
        if ($this->formatErrors === true) {
            foreach ($errors as $key => $message) {
                $fullErrors[] = [
                    'key' => $key,
                    'value' => $message,
                ];
            }
            return $fullErrors;
        }
        return $errors;
    }

    function formatErrors() {
        $this->formatErrors = true;
        return $this;
    }

    function build() {
        $json = [
            'status' => (int) $this->getStatus(),
            'message' => $this->getMessage(),
            'errors' => $this->getErrors(),
            'data' => $this->getData(),
        ];
        $this->appendDebug($json);
        $_json = array_merge($json, $this->getAttributes());
        return response()->json($_json, $this->getStatus());
    }

    private function appendDebug(&$json) {
        if (env('APP_API_DEBUG')) {
            $actionParts = explode('@', request()->route()->getActionName());
            $class = $actionParts[0];
            $method = $actionParts[1];
            $reflector = new \ReflectionClass($class);
            $methodReflector = new \ReflectionMethod($class, $method);
            $debug['route'] = [
                'controller' => request()->route()->getAction(),
                'path' => $reflector->getFileName(),
                'method' => $method,
                'line' => $methodReflector->getStartLine()
            ];
        }
        if (isset($debug)) {
            $json['debug'] = $debug;
        }
    }

    function api_model_set_paginate($collection ,$model)
    {
        $pagnation['data'] = $collection;
        $pagnation['total'] = $model->total();
        $pagnation['lastPage'] = $model->lastPage();
        $pagnation['perPage'] = $model->perPage();
        $pagnation['currentPage'] = $model->currentPage();
        $pagnation['currentPath'] = request()->fullUrl() . '?page=' . $model->currentPage();
        return $pagnation;
    }
}
