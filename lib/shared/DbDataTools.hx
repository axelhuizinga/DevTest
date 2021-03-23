package shared;

import haxe.ds.Map;

/**
 * ...
 * @author axel@cunity.me
 */
 
class DbDataTools
{
	
	public static function create(
		?dataErrors:Map<String,String>,
		?dataInfo:Map<String,Dynamic>,
		?dataParams:Map<String,Map<String,String>>,
		?dataRows:Array<Map<String,String>>
	):DbData{
		var dbData:DbData = new DbData();
		dbData.dataErrors = (dataErrors==null?new Map():dataErrors);
		dbData.dataInfo = (dataInfo==null?[
			'datetime'=>DateTools.format(Date.now(), '%Y-%m-%d_%H:%M:%S')
		]:new Map());
		dbData.dataParams = dataParams;
		dbData.dataRows = dataRows;	
		return dbData;	
	}
	
}