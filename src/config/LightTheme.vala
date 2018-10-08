namespace Tasks {
    public class LightTheme : AppTheme, GLib.Object {
        public string get_bg_color() {
            return "#EEEEEE";
        }

        public string get_text_primary_color() {
            return "#212121";
        }

        public string get_text_secondary_color() {
            return "#9E9E9E";
        }

        public string get_accent_color() {
            return "#2979FF";
        }
        
        public string get_alpha_accent_color() {
            return "rgba(41, 121, 255, 0.12)";
        }
    }
}
