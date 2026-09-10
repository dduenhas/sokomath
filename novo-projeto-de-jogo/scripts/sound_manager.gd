class_name SoundManager
extends Node

static var instance: SoundManager

signal music_toggled(is_enabled: bool)
signal sfx_toggled(is_enabled: bool)

@export var music_volume_db: float = -12.0
@export var sfx_volume_db: float = -4.0

var _bgm_player: AudioStreamPlayer
var _sfx_players: Array[AudioStreamPlayer] = []
var _current_sfx_index: int = 0
const MAX_SFX_PLAYERS: int = 8

const SOUNDS := {
	"bgm": "res://assets/audio/music/mr_cat_piano.mp3",
	"step": "res://assets/audio/sfx/step.wav",
	"push": "res://assets/audio/sfx/push.wav",
	"plate": "res://assets/audio/sfx/plate_active.wav",
	"win": "res://assets/audio/sfx/win.wav",
	"undo": "res://assets/audio/sfx/undo.wav",
	"click": "res://assets/audio/sfx/click.wav"
}

var _loaded_streams: Dictionary = {}
var is_music_muted: bool = false
var is_sfx_muted: bool = false

func _enter_tree() -> void:
	instance = self

func _ready() -> void:
	_preload_streams()
	_setup_players()
	play_music()

func _preload_streams() -> void:
	for key in SOUNDS:
		var path: String = SOUNDS[key]
		if ResourceLoader.exists(path):
			var stream = load(path)
			if key == "bgm" and stream is AudioStreamMP3:
				stream.loop = true
			_loaded_streams[key] = stream

func _setup_players() -> void:
	# BGM Player
	_bgm_player = AudioStreamPlayer.new()
	_bgm_player.volume_db = music_volume_db
	_bgm_player.bus = &"Master"
	add_child(_bgm_player)

	# SFX Pool
	for i in range(MAX_SFX_PLAYERS):
		var p := AudioStreamPlayer.new()
		p.volume_db = sfx_volume_db
		p.bus = &"Master"
		add_child(p)
		_sfx_players.append(p)

func play_music() -> void:
	if is_music_muted:
		return
	if _bgm_player and _loaded_streams.has("bgm"):
		if _bgm_player.stream != _loaded_streams["bgm"]:
			_bgm_player.stream = _loaded_streams["bgm"]
		if not _bgm_player.playing:
			_bgm_player.play()

func stop_music() -> void:
	if _bgm_player:
		_bgm_player.stop()

func set_music_enabled(enabled: bool) -> void:
	is_music_muted = not enabled
	if is_music_muted:
		stop_music()
	else:
		play_music()
	music_toggled.emit(not is_music_muted)

func toggle_music() -> bool:
	set_music_enabled(is_music_muted)
	return not is_music_muted

func set_sfx_enabled(enabled: bool) -> void:
	is_sfx_muted = not enabled
	sfx_toggled.emit(not is_sfx_muted)

func toggle_sfx() -> bool:
	set_sfx_enabled(is_sfx_muted)
	return not is_sfx_muted

func is_music_enabled() -> bool:
	return not is_music_muted

func is_sfx_enabled() -> bool:
	return not is_sfx_muted

func play_sfx(sfx_key: String, pitch_variance: float = 0.0) -> void:
	if is_sfx_muted:
		return
	if not _loaded_streams.has(sfx_key):
		return

	var stream: AudioStream = _loaded_streams[sfx_key]
	var player: AudioStreamPlayer = _sfx_players[_current_sfx_index]
	_current_sfx_index = (_current_sfx_index + 1) % MAX_SFX_PLAYERS

	player.stream = stream
	if pitch_variance > 0.0:
		player.pitch_scale = randf_range(1.0 - pitch_variance, 1.0 + pitch_variance)
	else:
		player.pitch_scale = 1.0

	player.play()

# Helper static methods for simple one-line calls
static func play(sfx_key: String, pitch_variance: float = 0.0) -> void:
	if instance:
		instance.play_sfx(sfx_key, pitch_variance)
