package action;

enum StatusAction
{	
	Update(
		status:{
			?className:String,
			?text:String,
			?path:String
		}
	);
}

