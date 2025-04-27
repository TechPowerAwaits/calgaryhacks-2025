@tool
extends EditorPlugin

const CreateExportPath = preload("res://addons/createexportpath/export.gd")
var createExportPath = CreateExportPath.new()


func _enter_tree() -> void:
	add_export_plugin(createExportPath)


func _exit_tree() -> void:
	remove_export_plugin(createExportPath)
