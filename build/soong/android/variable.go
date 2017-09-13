package android
type Product_variables struct {
	Has_legacy_camera_hal1 struct {
		Cflags []string
	}
	Uses_media_extensions struct {
		Cflags []string
	}
	Needs_text_relocations struct {
		Cppflags []string
	}
	BoardUsesQTIHardware struct {
		Cflags []string
		Cppflags []string
	}
	BoardUsesQCOMHardware struct {
		Cflags []string
		Cppflags []string
	}
	TargetUsesQCOMBsp struct {
		Cflags []string
		Cppflags []string
	}
	TargetUsesQCOMLegacyBsp struct {
		Cflags []string
		Cppflags []string
	}
	BoardUsesLegacyAlsa struct {
		Cflags []string
		Cppflags []string
	}
}

type ProductVariables struct {
	Has_legacy_camera_hal1  *bool `json:",omitempty"`
	Uses_media_extensions   *bool `json:",omitempty"`
	Needs_text_relocations  *bool `json:",omitempty"`
	QTIAudioPath            *string `json:",omitempty"`
	QTIDisplayPath          *string `json:",omitempty"`
	QTIMediaPath            *string `json:",omitempty"`
	Uses_non_treble_camera  *bool `json:",omitempty"`
	BoardUsesQTIHardware  *bool `json:",omitempty"`
	BoardUsesQCOMHardware  *bool `json:",omitempty"`
	TargetUsesQCOMBsp  *bool `json:",omitempty"`
	TargetUsesQCOMLegacyBsp  *bool `json:",omitempty"`
	BoardUsesLegacyAlsa  *bool `json:",omitempty"`
}
