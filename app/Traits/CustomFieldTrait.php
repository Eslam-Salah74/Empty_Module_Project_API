<?php
namespace App\Traits;
use \Modules\MasterData\CustomField\App\Models\CustomFieldData;
trait CustomFieldTrait
{

    public function custom_fields()
    {
        return $this->morphMany(\Modules\MasterData\CustomField\App\Models\CustomField::class,'customable');
    }

    public function addCustomField($data)
    {
        foreach($data as $item){
            $custom_field = $this->custom_fields()->create($item);
            // if($item['custom_field_data']){
            //     foreach($item['custom_field_data'] as $custom_field_data_item){
            //         $custom_field->custom_field_data()->create($custom_field_data_item);
            //     }
            // }
        }
        
    }

    public function updateCustomField($data)
    {
        $errors=0;
        $existingData = $this->custom_fields;
        $old_ids=$existingData->pluck('id')->toArray();
        $new_ids=[];
        foreach($data as $item)
        {
            $error=false;
            if(!empty($item['id']))
            {
                //update existing
                $new_ids[]=$item['id'];
                $custom=$this->custom_fields()->where("id",$item['id'])->first();
                //validate changed option but allready exist it custom field data
                if(!empty($custom) && $custom->type=="dropdown" && $item['type']=='dropdown')
                {
                    if($custom->options != $item['options'])
                    {
                        foreach($custom->options as $i=>$option)
                        {
                            $custom_data = CustomFieldData::where("custom_field_id",$custom->id)->where("value",$option)->count();
                            if($custom_data>0 && $option != $item['options'][$i])
                            {
                                $error=true;
                                $errors++;
                            }
                        }
                    }
                }
                //validate type changed from text or dropdown to file or other
                else if(in_array($custom->type,['text','dropdown']) && !in_array($item['type'],['text','dropdown']))
                {
                    $error=true;
                    $errors++;
                }
                //validate if type text changed to dropdown with options not including the values has been set in custom fields dara
                else if($custom->type=='text' && $item['type']=='dropdown')
                {
                    $custom_data = CustomFieldData::where("custom_field_id",$custom->id)->pluck('value')->toArray();
                    if(count(array_diff($custom_data,$item['options']))>0)
                    {
                        $error=true;
                        $errors++;
                    }
                            
                }
                if(!$error)
                    $this->custom_fields()->where("id",$item['id'])->update($item);
            }
            else //create new
                $custom_field = $this->custom_fields()->create($item);
        }
        //remove not existing
        $deleted_ids=array_diff($old_ids,$new_ids);
        foreach($this->custom_fields as $c)
        {
            if(in_array($c->id,$deleted_ids))
            $c->delete(); 
        }
        return $errors;
    }

}
