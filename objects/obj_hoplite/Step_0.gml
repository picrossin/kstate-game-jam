/// @description Insert description here
// You can write your code in this editor

if (zone.active) {
	melee_enemy_pathfinding(id, obj_player, zone);
	
	if(has_my_sword) {
		if(current_sword_cooldown <= 0) {
			if(collision_circle(x, y, sprite_get_width(spr_sword)/2, obj_player, true, true)) {
				hoplite_sword = instance_create_depth(x, y, -100, obj_hoplite_sword);
				hoplite_sword.owner = id;
				has_my_sword = false;
			}
		} else {
			--current_sword_cooldown;
		}
	}
}

/*
	Handles collisions with enemy weapons
*/
enemy_weapons = [obj_player_sword, obj_player_boomerang_airborne];
collided_with_weapon = false;
for(i = 0; i < array_length_1d(enemy_weapons); ++i) {
	if(place_meeting(x, y, enemy_weapons[i])) {
		collided_with_weapon = true;
		if(!hit_last_turn) {
			hit_last_turn = true;
			show_debug_message("I was hit");
			handle_damage(id, enemy_weapons[i].damage);
		}
	}
}
if(!collided_with_weapon) {
	hit_last_turn = false;
}