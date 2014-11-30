--基地温泉，回血回蓝
function home_hpmp_granter(keys)	
    local target = keys.target_entities   
	for _,_target in pairs(target)  do
   
        local hp = _target:GetHealth()
	    local mp = _target:GetMana()
        
	    if hp ~= _target:GetMaxHealth()  then 
               print("hp:"..hp)
               print("maxhelth:".._target:GetMaxHealth())
               _target:SetHealth(hp+100)
               _target:AddAbility("home_ability_hpmp_granter_special")	
               local ability1= _target:FindAbilityByName("home_ability_hpmp_granter_special")
               ability1:SetLevel(1)              
        else 
            if _target:HasModifier("modifier_hpmp_granter_special") then
               GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("removemodifier"), 
                                                    function()                                                   
                                                        _target:RemoveAbility("home_ability_hpmp_granter_special")
                                                        _target:RemoveModifierByName("modifier_hpmp_granter_special")
                                                        return nil
                                                    end, 0) 
           end
        end	 	
        if mp ~= _target:GetMaxMana() then 
            print("mp:"..mp)
            print("maxmana:".._target:GetMaxMana())              
               _target:AddAbility("home_ability_hpmp_granter_special")
               local ability1= _target:FindAbilityByName("home_ability_hpmp_granter_special")
               ability1:SetLevel(1)
               print(_target:HasAbility("home_ability_hpmp_granter_special"))
               print(_target:HasModifier("modifier_hpmp_granter_special")) 
               _target:SetMana(mp+20)	
        else 
            if _target:HasModifier("modifier_hpmp_granter_special") then
               GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("removemodifier"), 
                                                    function()                                                   
                                                        _target:RemoveAbility("home_ability_hpmp_granter_special")
                                                        _target:RemoveModifierByName("modifier_hpmp_granter_special")
                                                        return nil
                                                    end, 0) 
           end
        end 
        
    end
	return nil 											
end
