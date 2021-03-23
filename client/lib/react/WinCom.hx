package react;

@:jsRequire("react-window-communication-hook","default")
extern class WinCom{
	public static function useBrowserContextCommunication(channel:String):Dynamic;
	//public static function useState(message:String):Dynamic;
}