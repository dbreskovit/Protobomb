extends Node

var timer_on = true
var cock = false
var time_passed
var time = 420

var lamp_1 = false
var lamp_2 = false
var lamp_3 = false

func _process(delta):
	if cock == true:
		if(timer_on):
			time -= delta
		var secs = fmod(time,60)
		var mins = fmod(time, 60*60) / 60
		time_passed = "%02d:%02d" % [mins, secs]
