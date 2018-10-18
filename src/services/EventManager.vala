
namespace Tasks {
    public class EventManager {
        private string app_dir = Environment.get_user_cache_dir () + "/com.github.naz013.tasks";
        private string file_name;

        public EventManager () {
            file_name = this.app_dir + "/saved_events.json";
            debug ("%s".printf(file_name));
        }

        public void save_events(Gee.ArrayList<Event> events) {
            string json_string = prepare_json_from_events(events);
            var dir = File.new_for_path(app_dir);
            var file = File.new_for_path (file_name);

            try {
                if (!dir.query_exists()) {
                    dir.make_directory();
                }

                if (file.query_exists ()) {
                    file.delete ();
                }

                var file_stream = file.create (FileCreateFlags.REPLACE_DESTINATION);
                var data_stream = new DataOutputStream (file_stream);
                data_stream.put_string(json_string);
            } catch (Error e) {
                warning ("Failed to save notes %s\n", e.message);
            }

        }

        private string prepare_json_from_events (Gee.ArrayList<Event> events) {
            Json.Builder builder = new Json.Builder ();

            builder.begin_array ();
            foreach (Event event in events) {
                builder.begin_object ();
                // builder.set_member_name ("x");
                // builder.add_int_value (note.x);
                // builder.set_member_name ("y");
                // builder.add_int_value (note.y);
                // builder.set_member_name ("color");
                // builder.add_string_value (note.color);
                // builder.set_member_name ("content");
                // builder.add_string_value (note.content);
                // builder.set_member_name ("title");
                // builder.add_string_value (note.title);
                builder.end_object ();
            };
            builder.end_array ();

            Json.Generator generator = new Json.Generator ();
            Json.Node root = builder.get_root ();
            generator.set_root (root);

            string str = generator.to_data (null);
            return str;
        }

        public Gee.ArrayList<Event> load_from_file() {
            Gee.ArrayList<Event> stored_events = new Gee.ArrayList<Event>();

            try {
                var file = File.new_for_path(file_name);
                var json_string = "";
                if (file.query_exists()) {
                    string line;
                    var dis = new DataInputStream (file.read ());

                    while ((line = dis.read_line (null)) != null) {
                        json_string += line;
                    }

                    var parser = new Json.Parser();
                    parser.load_from_data(json_string);

                    var root = parser.get_root();
                    var array = root.get_array();
                    foreach (var item in array.get_elements()) {
                        var node = item.get_object();
                        // string color = node.get_string_member("color");
                        // int64 x = node.get_int_member("x");
                        // int64 y = node.get_int_member("y");
                        // string content = node.get_string_member("content");
                        // string title = node.get_string_member("title");
                        // Storage stored_note = new Storage.from_storage(x, y, color, content, title);
                        // stored_notes.add(stored_note);
                    }

                }

            } catch (Error e) {
                warning ("Failed to load file: %s\n", e.message);
            }

            return stored_events;
        }
    }
}
