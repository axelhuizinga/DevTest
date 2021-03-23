var scrollbarWidth;
export let config =
{
	api:'https://crm.bi4.me/server.php',
	fieldProps:{
		user:{
			className:'cRight'
		},
		pass:{
			className:'cCenter'
		},
		full_name:{
			flexGrow:1
		},
		user_level:{
			className:'cRight'
		},
		user_group:{
			flexGrow:1
		},
		active:{
			className:'cRight'
		}
	},
	formatDate:'%d.%m.%Y',
	locale:'de',
	getScrollbarWidth:function(recalculate) {
		var div1, div2;
		if (recalculate == null) {
		  recalculate = false;
		}
		if ((scrollbarWidth != null) && !recalculate) {
		  return scrollbarWidth;
		}
		if (document.readyState === 'loading') {
		  return null;
		}
		div1 = document.createElement('div');
		div2 = document.createElement('div');
		div1.style.width = div2.style.width = div1.style.height = div2.style.height = '100px';
		div1.style.overflow = 'scroll';
		div2.style.overflow = 'hidden';
		document.body.appendChild(div1);
		document.body.appendChild(div2);
		
		scrollbarWidth = Math.abs(div1.scrollWidth - div2.scrollWidth);
		//scrollbarWidth = Math.abs(div1.scrollHeight - div2.scrollHeight);
		document.body.removeChild(div1);
		document.body.removeChild(div2);
		return scrollbarWidth;
	},
	sidebarDims:{
		minWidth:'15%',
		maxWidth:'20%'
	}

}
