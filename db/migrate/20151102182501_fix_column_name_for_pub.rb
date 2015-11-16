class FixColumnNameForPub < ActiveRecord::Migration

    def change
        change_table :incidents do |i|
            i.rename :civilian_name, :person_name
            i.rename :civillian_weapon, :person_weapon
            i.rename :victim_case_number, :person_case_number
            i.rename :victim_charges_filed, :person_charges_filed
            i.rename :believed_civillian_armed, :believed_person_armed
            i.rename :victim_arrested, :person_arrested
            i.rename :victim_gang_member, :person_gang_member
            i.rename :victim_ignored_officer_commands, :person_ignored_officer_commands
            i.rename :victim_weapon_recovered, :person_weapon_recovered
            i.rename :victim_initiated_physical_threat, :person_initiated_physical_threat
            i.rename :victim_intoxicated, :person_intoxicated
            i.rename :victim_mentally_ill, :person_mentally_ill
            i.rename :victim_fired_weapon, :person_fired_weapon
            i.rename :victim_pointed_weapon, :person_pointed_weapon
            i.rename :victim_shot_in_back, :person_shot_in_back
            i.rename :victim_shot_in_head, :person_shot_in_head
            i.rename :victim_unarmed, :person_unarmed
            i.rename :officer_couldnt_see_victims_hands, :officer_couldnt_see_persons_hands
            i.rename :civillian_weapon_specific, :person_weapon_specific
        end

        change_table :transcriptions do |t|
            t.rename :civilian_name, :person_name
            t.rename :civillian_weapon, :person_weapon
            t.rename :victim_case_number, :person_case_number
            t.rename :victim_charges_filed, :person_charges_filed
            t.rename :believed_civillian_armed, :believed_person_armed
            t.rename :victim_arrested, :person_arrested
            t.rename :victim_gang_member, :person_gang_member
            t.rename :victim_ignored_officer_commands, :person_ignored_officer_commands
            t.rename :victim_weapon_recovered, :person_weapon_recovered
            t.rename :victim_initiated_physical_threat, :person_initiated_physical_threat
            t.rename :victim_intoxicated, :person_intoxicated
            t.rename :victim_mentally_ill, :person_mentally_ill
            t.rename :victim_fired_weapon, :person_fired_weapon
            t.rename :victim_pointed_weapon, :person_pointed_weapon
            t.rename :victim_shot_in_back, :person_shot_in_back
            t.rename :victim_shot_in_head, :person_shot_in_head
            t.rename :victim_unarmed, :person_unarmed
            t.rename :officer_couldnt_see_victims_hands, :officer_couldnt_see_persons_hands
        end
    end

end
