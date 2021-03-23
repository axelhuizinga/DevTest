package view.shared;

import haxe.Constraints.Function;
import view.shared.MenuProps;
import react.ReactComponent;
import react.ReactComponent.ReactComponentOfProps;
import react.ReactMacro.jsx;
import react.ReactUtil.copy;
import react.ReactPaginate;

using Lambda;

typedef PagerProps = {
	?previousLabel:String,//={'previous'}
	?nextLabel:String,//={'next'}
	?breakLabel:String,//={'...'}
	?breakClassName:String,//={'break-me'}
	pageCount:Int,//={this.state.pageCount}
	marginPagesDisplayed:Int,//={2}
	pageRangeDisplayed:Int,//={5}
	?onPageChange:Function,//={this.handlePageClick}
	?containerClassName:String,//={'pagination'}
	?subContainerClassName:String,//={'pages pagination'}
	?activeClassName:String,//={'active'}
	?activeLinkClassName:String,
	?pageLinkClassName:String,
	?previousClassName:String,
	?previousLinkClassName:String,
	?nextClassName:String,
	?nextLinkClassName:String,
	?disabledClassName:String,
	?hrefBuilder:Function,
	?ariaLableBuilder:Function
};

/**
 * ...
 * @author axel@cunity.me
 */

class Pager extends ReactComponentOfProps<PagerProps>
{
	var linkCount:Int;
	var firstEllipsis:Bool;
	var secondEllipsis:Bool;

	public function new(props) 
	{
		super(props);
		linkCount = (props.linkCount>0?props.linkCount:7);
		firstEllipsis = props.total > linkCount;
		secondEllipsis = total > props.linkCount*2;
	}
	function renderPageLinks():ReactFragment
	{
		return jsx('						
			<$ReactPaginate pageCount=${props.pageCount}>'
		;)
		return null;
	}

	override public function render()
	{
		return jsx('
			<div className="columns">
				<nav class="pagination" role="navigation" aria-label="pagination">
  					<a class="pagination-previous" title="This is the first page" 
					  ${props.current==props.first?'disabled':''}>Zurück</a>
					<a class="pagination-next" ${props.current==props.last?'disabled':''}>Weiter</a>
					<ul class="pagination-list">

				<span class="labeled" >
					Seite:
					<input name="first" onchange=${handleChange}/>
				</span>
				<span class="labeled" >
					bis:
					<input name="last" onchange=${handleChange}/>
				</span>	
				<span class="labeled" >
					von:
					<input name="total" onchange=${handleChange}/>
				</span>							
			</div>			
		');
	}
	
}