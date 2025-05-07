extends EditorExportPlugin

func _get_name() -> String:
	return "CreateExportPath"

# Purpose: Creates the directories that make up the given path if they don't already exist.
func _export_begin(_features: PackedStringArray, _is_debug: bool, path: String, _flags: int) -> void:
	var basePath: String = path.get_base_dir()
	var absBasePath: String = ("res://" if basePath.is_absolute_path() else "") + basePath 
	
	if not DirAccess.dir_exists_absolute(absBasePath):
		var err = DirAccess.make_dir_recursive_absolute(absBasePath)
		
		if err:
			printerr("Failed to create dir '", absBasePath, "': ", error_string(err))
		else:
			print("Created dir '", absBasePath, "'")
