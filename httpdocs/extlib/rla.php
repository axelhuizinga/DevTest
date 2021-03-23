<?php
/**
 * parse uploaded debit return statements 
 */

use Genkgo\Camt\Config;
use Genkgo\Camt\Reader;
use SimpleXMLElement;

require_once('vendor/autoload.php');
require_once('autoload.php');
require_once("/var/www/{$_SERVER['HTTP_HOST']}/.crm/functions.php");
/**/
$loader = new Autoloader();
$loader->setNamespacePrefix('')
       ->setBaseDir(__DIR__.DIRECTORY_SEPARATOR)
       ->register();
$appLog = "/var/www/{$_SERVER['HTTP_HOST']}/log/app.log";
#edump("FILES:".print_r($_FILES,1));
edump("FILE:".print_r($_GET,1));
#edump(strlen(file_get_contents($_GET['file'])));
#print_r($loader);
#exit('OK');

$config = Config::getDefault();
#$config->disableXsdValidation();
##edump($config);
$reader = new Reader($config);

$message = $reader->readFile($_GET['file']);
if(!$_GET['debug'])
	unlink($_GET['file']);
#print_r($message);
$s_i = 0;
$r = 0;
$t = 0;
#edump(get_included_files());
edump(strlen(print_r($message,1)));
$statements = $message->getRecords();
$count_statements = count($statements);
#edump($statements);
$rla = array();
foreach ($statements as $statement) {		
	$entries = $statement->getEntries();
	$count_entries = count($entries);
	edump($count_entries);
	#edump($statement);
	foreach($entries as $entry)
	{
		$money = $entry->getAmount();# Money object
		#edump($entry);
		### CHECK IF RECORD IS A RETURN TRANSACTION
		if($rInfo = $entry->getTransactionDetail()->getReturnInformation()){
			$traDet = $entry->getTransactionDetail();
			$account = $traDet->getRelatedParties()[1]->getAccount();
			#edump($traDet->getRelatedParties()[1]->getAccount()->getIdentification());
			edump($rInfo->getCode().'::'.sprintf("%.2f", $money->getAmount()/100).'::'.$money->isNegative());			
			#edump('getReference:'.$traDet->getReference()->getMandateId().' getAccountServicerReference::'.$entry-> getAccountServicerReference().' getAccount::'.get_class($account).'<');
			#edump('getRemittanceInformation:'.$traDet->getRemittanceInformation()->getMessage().' getRelatedPartyAccount::'.$account->getIdentification().'  getEndToEndId::'.$traDet->getReference()->getEndToEndId());
			$rlData = array(
				'id'=>intval($traDet->getReference()->getMandateId()),
				'ba_id'=>$traDet->getReference()->getEndToEndId(),
				'iban'=>$account->getIdentification(),
				'sepa_code'=>$rInfo->getCode(),
				'dealId'=>$traDet->getReference()->getMandateId(),
				'amount'=>sprintf("%.2f", $money->getAmount()/100)
			);
			array_push($rla,$rlData);
			#edump($rlData);
		}
		else{
			### normal transaction						
		}
	}
	#print_r($entries);
}
	header('Content-Type: application/json');
	#echo json_encode(array('rlData'=>$rla),JSON_FORCE_OBJECT);
	echo json_encode(array('rlData'=>$rla));

?>