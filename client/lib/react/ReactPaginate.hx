package react;

import haxe.Constraints.Function;

/**
 * ...
 * @author axel@cunity.me
 */
 
typedef ReactPaginateProps={
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

@:jsRequire('react-paginate', 'default')
extern class ReactPaginate extends ReactComponent 
{}