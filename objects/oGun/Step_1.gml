x = oPlayer.x;
y = oPlayer.y+10;

if (oPlayer.controller == 0)
{
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		controllerangle = point_direction(0,0,controllerh,controllerv);
	}
	image_angle = controllerangle;
}

firingdelay = firingdelay - 1;
recoil = max(0,recoil - 1);

if ((mouse_check_button(mb_left)) || gamepad_button_check(0,gp_shoulderrb)) && (firingdelay <0)
{
	recoil = 4;
	firingdelay = 5;
	ScreenShake(2,10);
	audio_sound_pitch(snShot,choose(0.8,1.0,1.2));
	audio_play_sound(snShot,5,false);
	with (instance_create_layer(x,y,"Bullets",oBullet))
	{
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_x(recoil,image_angle);