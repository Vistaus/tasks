namespace Tasks {
    public class Logger {
        private static bool IS_DEBUG = true;

        public static void log(string message) {
            if (IS_DEBUG) {
                print(@"$message\n");
            }
        }
        
        public static void log_inline(string message) {
            if (IS_DEBUG) {
                print(message);
            }
        }
    }
}
