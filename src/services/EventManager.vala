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
                
                builder.set_member_name ("id");
                builder.add_int_value (event.id);
                
                builder.set_member_name ("due_date_time");
                builder.add_int_value (event.due_date_time);
                
                builder.set_member_name ("event_type");
                builder.add_int_value (event.event_type);
                
                builder.set_member_name ("timer_time");
                builder.add_int_value (event.timer_time);
                
                builder.set_member_name ("summary");
                builder.add_string_value (event.summary);
                builder.set_member_name ("description");
                builder.add_string_value (event.description);
                
                builder.set_member_name ("is_active");
                builder.add_boolean_value (event.is_active);
                builder.set_member_name ("has_reminder");
                builder.add_boolean_value (event.has_reminder);
                builder.set_member_name ("show_notification");
                builder.add_boolean_value (event.show_notification);
                
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
                        
                        string summary = node.get_string_member("summary");
                        string description = node.get_string_member("description");
                        
                        int64 timer_time = node.get_int_member("timer_time");
                        uint id = (uint) node.get_int_member("id");
                        
                        bool is_active = node.get_boolean_member("is_active");
                        bool has_reminder = node.get_boolean_member("has_reminder");
                        bool show_notification = node.get_boolean_member("show_notification");
                        
                        int64 event_type = node.get_int_member("event_type");
                        int64 due_date_time = node.get_int_member("due_date_time");
                        
                        Event event = new Event();
                        event.id = id;
                        event.due_date_time = due_date_time;
                        
                        event.event_type = event_type;
                        event.is_active = is_active;
                        event.has_reminder = has_reminder;
                        event.show_notification = show_notification;
                        event.timer_time = timer_time;
                        
                        event.summary = summary;
                        event.description = description;
                        
                        stored_events.add(event);
                    }

                }

            } catch (Error e) {
                warning ("Failed to load file: %s\n", e.message);
            }

            return stored_events;
        }
    }
}
