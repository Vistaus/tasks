namespace Tasks {
    public class CssData : GLib.Object {
        
        public const string SHOW_BORDER = "show_border";
        
        public const string MATERIAL_CARD = "material_card";
        public const string MATERIAL_SWITCH = "material_switch";
        public const string MATERIAL_RADIO_BUTTON = "material_radio_button";
        public const string MATERIAL_BUTTON = "material_button";
        public const string MATERIAL_FAB = "material_fab";
        public const string MATERIAL_BUTTON_FLAT = "material_button_flat";
        public const string MATERIAL_BUTTON_OK = "material_button_ok";
        public const string MATERIAL_BUTTON_CANCEL = "material_button_cancel";
        public const string MATERIAL_TEXT_FIELD = "material_text_field";
        public const string MATERIAL_HINT_LABEL = "material_hint_label";
        public const string MATERIAL_HINT_ERROR = "material_hint_error";
        public const string MATERIAL_SNACKBAR = "material_snackbar";
        
        public const string LABEL_PRIMARY = "body2";
        public const string LABEL_SECONDARY = "body1";
        
        private AppTheme theme;

        public CssData() {
            this.with_theme(new DarkTheme());
        }

        public CssData.with_theme(AppTheme theme) {
          this.theme = theme;
        }

        public string get_css_data() {
            string style = null;
            if (Gtk.get_minor_version() < 20) {
                style = (N_("""
                @define-color textColorPrimary %s;
                @define-color textColorSecondary %s;
                @define-color bgColor %s;
                @define-color accentColor %s;
                @define-color accentAlphaColor %s;
                
                .input_field {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: @bgColor;
                    border: 1px solid @textColorSecondary;
                    border-radius: 5px 5px 0px 0px;
                    padding: 5px;
                }
                
                .input_field:focus {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border-left: 1px solid @accentAlphaColor;
                    border-top: 1px solid @accentAlphaColor;
                    border-right: 1px solid @accentAlphaColor;
                    border-bottom: 1px solid @accentColor;
                    border-radius: 5px 5px 0px 0px;
                    padding: 5px;
                }
                
                .time_label {
                    font-size: 10px;
                    color: @textColorPrimary;
                }
                
                .hint_label {
                    font-size: 10px;
                    color: @accentColor;
                }

                .mainwindow {
                    background-color: @bgColor;
                    box-shadow: #1a1a1a;
                }

                .popover {
                    background-color: @bgColor;
                    box-shadow: #1a1a1a;
                }

                .mode_label {
                    color: @textColorPrimary;
                }

                .add_button {
                    color: @textColorPrimary;
                }

                GtkTextView.view {
                    color: @textColorPrimary;
                    font-size: 11px;
                }
                
                .empty_label {
                    color: @textColorPrimary;
                    font-size: 15px;
                    background: @bgColor;
                }

                GtkTextView.view:selected {
                    color: #FFFFFF;
                    background-color: #64baff;
                    font-size: 11px;
                }

                .window GtkTextView,
                .window GtkHeaderBar {
                    background-color: @bgColor;
                    border-bottom-color: @bgColor;
                    box-shadow: none;
                }
                """)).printf(
                    theme.get_text_primary_color(),
                    theme.get_text_secondary_color(),
                    theme.get_bg_color(),
                    theme.get_accent_color(),
                    theme.get_alpha_accent_color()
                );
            } else {
                style = "".concat(add_color("textColorPrimary", theme.get_text_primary_color()));
                style = style.concat(add_color("textColorSecondary", theme.get_text_secondary_color()));
                style = style.concat(add_color("bgColor", theme.get_bg_color()));
                style = style.concat(add_color("accentColor", theme.get_accent_color()));
                style = style.concat(add_color("accentLightColor", theme.get_accent_light_color()));
                style = style.concat(add_color("accentDarkColor", theme.get_accent_dark_color()));
                style = style.concat(add_color("accentAlphaColor", theme.get_alpha_accent_color()));
                style = style.concat(add_color("textColorDisabled", theme.get_text_disabled_color()));
                style = style.concat(add_color("cardBgColor", theme.get_card_bg_color()));
                style = style.concat(add_color("shadowColor", theme.get_shadow_color()));
                style = style.concat(add_color("shadowOutColor", theme.get_shadow_out_color()));
                style = style.concat(add_color("buttonDisabledColor", theme.get_button_disabled_color()));
                style = style.concat("""
                
                .timer_label {
                    color: @textColorPrimary;
                    font-size: 20px;
                }
                
                .timer_view {
                    background: @accentAlphaColor;
                }
                
                .invisible_view {
                    border: 0px;
                    background: transparent;
                    color: transparent;
                    margin: 15px;
                }
                
                .invisible_view progress {
                    border: 0px;
                    background: transparent;
                    color: transparent;
                }
                
                .invisible_view pulse {
                    border: 0px;
                    background: transparent;
                    color: transparent;
                }
                
                .invisible_view selection {
                    border: 0px;
                    background: transparent;
                    color: transparent;
                }
                
                .invisible_view:focus {
                    border: 0px;
                    background: transparent;
                    color: transparent;
                    margin: 15px;
                }
                
                calendar:selected {
                    color: #fff;
                    background: @accentColor;
                }

                calendar {
                    color: @textColorPrimary;
                    background: transparent;
                }
                
                calendar.button {
                    color: @textColorPrimary;
                    border: 1px solid transparent;
                    box-shadow: none;
                    padding: 4px;
                    background: transparent;
                    border-radius: 5px;
                }

                calendar.button:disabled {
                    color: @textColorDisabled;
                    border: 1px solid transparent;
                    box-shadow: none;
                    padding: 4px;
                    background: transparent;
                    border-radius: 5px;
                }

                calendar.button:hover {
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border: 1px solid @accentAlphaColor;
                    border-radius: 5px;
                    padding: 4px;
                    box-shadow: none;
                }
                
                calendar.button:hover:active {
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border: 1px solid @accentAlphaColor;
                    border-radius: 5px;
                    padding: 4px;
                    box-shadow: none;
                }
                
                calendar.button:active {
                    color: @textColorPrimary;
                    border: 1px solid transparent;
                    box-shadow: none;
                    padding: 4px;
                    background: transparent;
                    border-radius: 5px;
                }
                
                spinbutton.vertical {
                    border: 0px;
                    background: transparent;
                    box-shadow: none;
                }
                
                spinbutton entry {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: transparent;
                    border: 0px;
                    box-shadow: none;
                    border-radius: 0px;
                    padding: 5px;
                }

                spinbutton button {
                    color: @textColorPrimary;
                    border: 1px solid transparent;
                    box-shadow: none;
                    padding: 4px;
                    background: transparent;
                    border-radius: 5px;
                }

                spinbutton button:disabled {
                    color: @textColorDisabled;
                    border: 1px solid transparent;
                    box-shadow: none;
                    padding: 4px;
                    background: transparent;
                    border-radius: 5px;
                }

                spinbutton button:hover {
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border: 1px solid @accentAlphaColor;
                    border-radius: 5px;
                    padding: 4px;
                    box-shadow: none;
                }
                
                spinbutton button:hover:active {
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border: 1px solid @accentAlphaColor;
                    border-radius: 5px;
                    padding: 4px;
                    box-shadow: none;
                }
                
                spinbutton button:active {
                    color: @textColorPrimary;
                    border: 1px solid transparent;
                    box-shadow: none;
                    padding: 4px;
                    background: transparent;
                    border-radius: 5px;
                }
                
                .time_label {
                    font-size: 10px;
                    color: @textColorPrimary;
                }
                
                .time_button {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: transparent;
                    border: 0px;
                    border-radius: 0px;
                    box-shadow: none;
                }

                .mainwindow {
                    background-color: @bgColor;
                    box-shadow: #1a1a1a;
                }

                .popover {
                    background-color: @bgColor;
                    box-shadow: #1a1a1a;
                }

                .mode_label {
                    color: @textColorPrimary;
                }
                
                .moon_icon {
                    border: 0px;
                    color: @textColorPrimary;
                    box-shadow: none;
                    background: transparent;
                }
                
                .icon_button {
                    border: 1px solid transparent;
                    color: @textColorPrimary;
                    box-shadow: none;
                    background: transparent;
                    border-radius: 5px;
                }
                
                .icon_button:hover, .icon_button:hover:active  {
                    background: @accentAlphaColor;
                    border: 1px solid @accentAlphaColor;
                    border-radius: 5px;
                    color: @textColorPrimary;
                    box-shadow: none;
                }
                
                .body1 {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: transparent;
                    border: 0px;
                    box-shadow: none;
                    border-radius: 0px;
                    font-weight: normal;
                }
                
                .body2 {
                    font-size: 15px;
                    color: @textColorPrimary;
                    background: transparent;
                    border: 0px;
                    box-shadow: none;
                    border-radius: 0px;
                    font-weight: bold;
                }
                
                .empty_label {
                    color: @textColorPrimary;
                    font-size: 15px;
                }
                
                .list_container {
                    background: transparent;
                }
                
                .scrollable {
                    padding: 16px;
                }
                
                .right_block {
                    background: @cardBgColor;
                    border-radius: 2px;
                    margin-top: 8px;
                    margin-left: 8px;
                    box-shadow: 0 1px 2px @shadowColor, 0 1px 2px @shadowOutColor;
                    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
                }
                
                .material_switch {
                    border: 1px solid @buttonDisabledColor;
                    background: @buttonDisabledColor;
                }
                
                .material_switch:checked {
                    border: 1px solid @accentLightColor;
                    background: @accentLightColor;
                }
                
                .material_switch slider {
                    background: @accentColor;
                }
                
                .material_card {
                    background: @cardBgColor;
                    border-radius: 2px;
                    margin-top: 8px;
                    margin-left: 8px;
                    margin-right: 8px;
                    padding: 16px;
                }
                
                .material_card {
                    box-shadow: 0 1px 2px @shadowColor, 0 1px 2px @shadowOutColor;
                    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
                }
                
                .material_card:selected {
                    box-shadow: 0 14px 28px @shadowColor, 0 10px 10px @shadowOutColor;
                }
                
                .material_button_flat, 
                .material_button_flat:hover, 
                .material_button_flat:hover:active,
                .material_button_flat:selected {
                    border-radius: 0px;
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: transparent;
                    border: 0px;
                    padding: 0px;
                    box-shadow: none;
                    font-weight: normal;
                }
                
                .material_radio_button {
                    border-radius: 0px;
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: transparent;
                    border: 0px;
                    padding: 0px;
                    margin: 5px;
                    box-shadow: none;
                    font-weight: normal;
                }
                
                .material_radio_button radio {
                    color: @accentColor;
                    border: 1px solid @accentColor;
                    background: transparent;
                }
                
                .material_fab {
                    border-radius: 25px;
                    color: #fff;
                    border: 0px;
                    padding-top: 8px;
                    padding-bottom: 8px;
                    background: @accentColor;
                    box-shadow: 0 1px 2px @shadowColor, 0 1px 2px @shadowOutColor;
                    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
                }
                
                .material_fab:hover  {
                    border-radius: 25px;
                    border: 0px;
                    color: #fff;
                    background: @accentColor;
                    box-shadow: 0 1px 3px @shadowColor, 0 1px 3px @shadowOutColor;
                }
                
                .material_fab:selected, .material_fab:hover:active {
                    border-radius: 25px;
                    color: #fff;
                    outline: 0px;
                    border: 0px;
                    background: @accentColor;
                    box-shadow: 0 1px 4px @shadowColor, 0 1px 4px @shadowOutColor;
                }
                
                .material_fab:disabled {
                    border-radius: 25px;
                    color: @textColorDisabled;
                    border: 0px;
                    background: @buttonDisabledColor;
                    box-shadow: none;
                }
                
                .material_button {
                    border-radius: 2px;
                    color: #fff;
                    margin: 4px;
                    border: 0px;
                    padding-top: 8px;
                    padding-bottom: 8px;
                    background: @accentColor;
                    box-shadow: 0 1px 2px @shadowColor, 0 1px 2px @shadowOutColor;
                    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
                }
                
                .material_button:hover  {
                    border-radius: 2px;
                    border: 0px;
                    color: #fff;
                    margin: 4px;
                    background: @accentColor;
                    box-shadow: 0 1px 3px @shadowColor, 0 1px 3px @shadowOutColor;
                }
                
                .material_button:selected, .material_button:hover:active {
                    border-radius: 2px;
                    color: #fff;
                    margin: 4px;
                    outline: 0px;
                    border: 0px;
                    background: @accentColor;
                    box-shadow: 0 1px 4px @shadowColor, 0 1px 4px @shadowOutColor;
                }
                
                .material_button:disabled {
                    border-radius: 2px;
                    color: @textColorDisabled;
                    margin: 4px;
                    border: 0px;
                    background: @buttonDisabledColor;
                    border-radius: 5px;
                    box-shadow: none;
                }
                
                .material_text_field {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border: 1px solid @accentAlphaColor;
                    border-radius: 5px 5px 0px 0px;
                    padding: 5px;
                }
                
                .material_text_field:focus {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border-left: 1px solid @accentAlphaColor;
                    border-top: 1px solid @accentAlphaColor;
                    border-right: 1px solid @accentAlphaColor;
                    border-bottom: 1px solid @accentColor;
                    border-radius: 5px 5px 0px 0px;
                    padding: 5px;
                }
                
                .material_text_field:indeterminate {
                    font-size: 13px;
                    color: @textColorPrimary;
                    background: @accentAlphaColor;
                    border-left: 1px solid @accentAlphaColor;
                    border-top: 1px solid @accentAlphaColor;
                    border-right: 1px solid @accentAlphaColor;
                    border-bottom: 1px solid red;
                    border-radius: 5px 5px 0px 0px;
                    padding: 5px;
                }
                
                .material_hint_label {
                    font-size: 10px;
                    color: @accentColor;
                    padding-left: 5px;
                }
                
                .material_hint_error {
                    font-size: 10px;
                    color: red;
                    padding-left: 5px;
                }
                
                .material_snackbar {
                    background: @cardBgColor;
                    padding-left: 16px;
                    padding-right: 16px;
                    padding-top: 8px;
                    padding-bottom: 8px;
                    margin-bottom: 8px;
                    margin-top: 16px;
                    margin-left: 16px;
                    margin-right: 16px;
                    border-radius: 2px;
                    box-shadow: 0 2px 2px @shadowColor, 0 2px 2px @shadowOutColor;
                    transition: all 0.3s cubic-bezier(.25,.8,.25,1);
                }
                
                .show_border {
                    border: 1px solid @accentColor;
                }

                .window textview.view text,
                .window headerbar {
                    background-color: @bgColor;
                    border-bottom-color: @bgColor;
                    box-shadow: none;
                }
                """);
            }                               
            return style;
        }
        
        private string add_color(string name, string color) {
            return "@define-color ".concat(name).concat(" ").concat(color).concat(";\n");
        }
    }
}
