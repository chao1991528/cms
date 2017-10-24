	var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset, generatedCount = 0;
/**
 * 下拉刷新 （自定义实现此方法）
 */
	function pullDownAction () {
		setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
			location.reload();  
		}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
	}

/**
 * 滚动翻页 （自定义实现此方法）
 * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
 */
	function pullUpAction (arry) {
		setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
			var $li, i;
			for (i=0; i<arry.length; i++) {
				$li = $('<li><a href="" class="clearBoth"><div class="series-picture"><img src="'+arry[i].img+'" alt=""></div><div class="series-title productList"><div class="product-name">'+arry[i].name+'</div><div class="product-category">'+arry[i].category+'</div></div><div class="series-in"><img src="images/right.png" alt=""></div></a></li>');
				$('#thelist').append($li);
			}
			
			myScroll.refresh();		// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
		}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
	}

/**
 * 初始化iScroll控件
 */
	function loaded() {
		pullDownEl = document.getElementById('pullDown');
		pullDownOffset = pullDownEl.offsetHeight;
		pullUpEl = document.getElementById('pullUp');	
		pullUpOffset = pullUpEl.offsetHeight;
		
		myScroll = new iScroll('wrapper', {
			scrollbarClass: 'myScrollbar', /* 重要样式 */
			useTransition: false, /* 此属性不知用意，本人从true改为false */
			topOffset: pullDownOffset,
			onRefresh: function () {
				if (pullDownEl.className.match('loading')) {
					pullDownEl.className = '';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
				} else if (pullUpEl.className.match('loading')) {
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				}
			},
			onScrollMove: function () {
				if (this.y > 5 && !pullDownEl.className.match('flip')) {
					pullDownEl.className = 'flip';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
					this.minScrollY = 0;
				} else if (this.y < 5 && pullDownEl.className.match('flip')) {
					pullDownEl.className = '';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
					this.minScrollY = -pullDownOffset;
				} else if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
					pullUpEl.className = 'flip';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
					this.maxScrollY = this.maxScrollY;
				} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
					this.maxScrollY = pullUpOffset;
				}
			},
			onScrollEnd: function () {
				if (pullDownEl.className.match('flip')) {
					pullDownEl.className = 'loading';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';				
					pullDownAction();	// Execute custom function (ajax call?)
				} else if (pullUpEl.className.match('flip')) {
					/*获取数据*/
					var arry = [{'img':'images/img1.jpg', 'name':'图片111111', 'category':'系列111'}, {'img':'images/img1.jpg', 'name':'图片22222', 'category':'系列2222'}];
					pullUpEl.className = 'loading';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';				
					pullUpAction(arry);	// Execute custom function (ajax call?)
				}
			}
		});
		
		setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
	}

//初始化绑定iScroll控件 
	document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
	document.addEventListener('DOMContentLoaded', loaded, false);
