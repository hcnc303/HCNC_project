var Calendar = Class.create();
var CheckInSltYear = 0;
var CheckOutSltYear = 0;
var	sltDay = 0;
var sltFullDate = 0;
var CheckInDay = 0;
var ftDay = 0;

var allowDaysCnt = 0;       // 오는날 - 가는날 허용 날짜수
var allowSameDay = false;   // 오는날/가는날 같아도 되는지 여부
var titleType = "";         // 달력 타입

Calendar.prototype = {

	container: null,
	year: null,
	month: null,
	selectedItems: null,
	holidayItems: null,
	options: null,
	onSelected: null,
	onSelected2: null,
	goLink : null,
	today : null,

	styleNames: {
		row: "calRow",
		cell: "default",
		cellSelected: "choice",
		cellWeekend: "calCellWeekend",
		cellSaturday: "calCellSaturday",
		cellSunday: "holiday",
		cellLated: "calCellLated"
	},

	initialize: function(container, year, month, options, goLink) {
		this.container = container;
		this.year = year;
		this.month = month;
		this.options = $H( {
			multiple: true
		} );
		this.options.merge(options);
		this.goLink = goLink;
		if (!this.selectedItems)
			this.selectedItems = new CalendarItemRepository();
		if (!this.holidayItems)
			this.holidayItems = new CalendarItemRepository();

		this.today = false;
	},

	setTodayFlag: function(flag) {
	    this.today = flag;
	},

	previousMonth: function(value) {
		if (value == null) {
			value = -1;
		}
		this.addMonth(value);
		this.generateCalendar();
	},

	nextMonth: function(value) {
		if (value == null) {
			value = 1;
		}
		this.addMonth(value);
		this.generateCalendar();
	},

	addMonth: function(amount) {
		var _date = new Date(this.year, this.month-1, 1);
		_date.setMonth(_date.getMonth()+amount);

		this.year = _date.getFullYear();
		this.month = _date.getMonth() + 1;
	},
	
	changeYearMonth:function(sltYear,sltMonth)
	{
		var _date = new Date(sltYear, sltMonth-1, 1);

		this.year = _date.getFullYear();
		this.month = _date.getMonth() + 1;
		
	    this.generateCalendar();
	},

	generateCalendar: function() {
	
		var table = $(this.container);
		
		var tid=$(this.container).id;
		
		if (table) {
			// 기존 달력 없애기
			this.removePreviousCalendar();

			// 새로운 데이터로 달력 생성
			var dateArray = this.generateDateArray();
			var dateToday = new Date();
			
	        var domAirDiffDays = (allowSameDay == true) ? 1 : 0;    // 국내항공 - 같은 날 왕복 선택 가능
	        var airDiffDays = 0;                                    // 해외항공 - 내일부터 선택 가능
	        
	        if(titleType == "Air")
	        {
	            if(dateToday.getHours() >= 17) airDiffDays = 2;
	            else airDiffDays = 1;
	        }
	        
			dateArray.each(function(date, index) {
				var row = table.getElementsByTagName('tbody')[0].insertRow(index);
				$(row).addClassName(this.styleNames.row);

				date.each(function(week) {
					// 셀 생성
					//var cell = row.insertCell();
					var cell = document.createElement("TD");
					row.appendChild(cell);

					cell.calendarItem = week;

					// 2007-11-05 kj : 지난 날짜는 날짜에 Strike를 먹인 문자를 표시한다.
					var celldate = new Date(this.year, this.month-1, week.getDate());
                    
					// if(celldate.format("yyyyMMdd") < dateToday.format("yyyyMMdd")){
					if(dateFormatting(celldate) < dateFormatting(addDay2(dateToday, airDiffDays))){
					    if(this.today){
					        if (celldate.toDateString() != dateToday.toDateString()) {
					            $(cell).addClassName(this.styleNames.cellLated);
					        }
                        } else {
                            $(cell).addClassName(this.styleNames.cellLated);
                        }
                         cell.innerHTML =""+ week.getDate()+"";  
                    }
                    else
                    {
                            if(week.getDate()==""){
                                 cell.innerHTML =""+ week.getDate()+"";  
                                 //cell.innerHTML ="<a href='#' onclick='return false;'>"+ week.getDate()+"</a>";
                            }else{
                                          if (CheckInDay==0){
                                                // if(celldate.format("yyyyMMdd") < dateToday.format("yyyyMMdd")){
                                                if(dateFormatting(celldate) < dateFormatting(dateToday)){
                                                    cell.innerHTML =""+ week.getDate()+"";
                                                }
                                                else{
			                                            cell.id = "td_0_" + week;
                                                        cell.innerHTML ="<a href='#' onclick='return false;'>"+ week.getDate()+"</a>";
                                                             // 각 날짜 cell의 이벤트 처리
                                                            if (!week.isEmpty()) {
                                                                    week.selectedCell = $(cell);
                                                                    //$(cell).setStyle( $H( { cursor: "pointer" } ) );
                                                                    var styles = $H({ cursor: "pointer" }); 
                                                                    $(cell).setStyle(styles.toObject());           
                                                             }                                                                     
                                                            cell.observe("click", function() {
                                                                    if (!this.options.multiple && this.selectedItems.items.length > 0) {
                                                                        this.removeAllCalendarItems();
                                                                    }
                                                                    if (week.selected) {this.removeCalendarItem(week);
                                                                    }else {
                                                                        
                                                                        this.addCalendarItem(week);
                                                                    }
                                                                    if (this.onSelected && typeof(this.onSelected) == "function") {
                                                                        if(celldate > dateToday || (this.today && celldate.toDateString() == dateToday.toDateString())){
                                                                            this.onSelected();
                                                                        }
                                                                    }
                                                            }.bind(this));
                                                }
                                                
                                          }else {
                                                    //가는날 선택된 상태에서 오는날 달력 그리기
                                                   if(tid=="calendar_c3_2")  
                                                   {
                                                              var tmpstr = new Date(this.year, this.month - 1, week.getDate());
                                                              
                                                              //선택 가능한 날짜
                                                              if ((dateFormatting(CheckInDay) < dateFormatting(addDay2(tmpstr, domAirDiffDays))) && (allowDaysCnt == 0 || (tmpstr <= ftDay && allowDaysCnt > 0)))
                                                              {
                                                                       cell.id = "td_1_" + week;
                                                                       cell.innerHTML ="<a href='#' onclick='return false;'>"+ week.getDate()+"</a>";  
                                                                        if (!week.isEmpty()) {
                                                                                week.selectedCell = $(cell);
                                                                                
                                                                                var styles = $H({ cursor: "pointer" }); 
                                                                                $(cell).setStyle(styles.toObject());           
                                                                         }                                                                     
                                                                        cell.observe("click", function() {
                                                                                if (!this.options.multiple && this.selectedItems.items.length > 0) {
                                                                                    this.removeAllCalendarItems();
                                                                                }
                                                                                if (week.selected) {this.removeCalendarItem(week);
                                                                                }else {this.addCalendarItem(week);
                                                                                }
                                                                                if (this.onSelected2 && typeof(this.onSelected2) == "function") {
                                                                                    if(celldate > dateToday || (this.today && celldate.toDateString() == dateToday.toDateString())){
                                                                                        this.onSelected2();
                                                                                    }
                                                                                }
                                                                        }.bind(this));
                                                              
                                                              }
                                                              else
                                                              {
                                                                     cell.innerHTML =""+ week.getDate()+"";
                                                              }
                                                  }
                                                  else
                                                  {
                                                         cell.innerHTML ="<a href='#' onclick='return false;'>"+ week.getDate()+"</a>";
                                                             // 각 날짜 cell의 이벤트 처리
                                                            if (!week.isEmpty()) {
                                                                    week.selectedCell = $(cell);
                                                                    //$(cell).setStyle( $H( { cursor: "pointer" } ) );
                                                                    var styles = $H({ cursor: "pointer" }); 
                                                                    $(cell).setStyle(styles.toObject());           
                                                             }                                                                     
                                                            cell.observe("click", function() {
                                                                    if (!this.options.multiple && this.selectedItems.items.length > 0) {
                                                                        this.removeAllCalendarItems();
                                                                    }
                                                                    if (week.selected) {this.removeCalendarItem(week);
                                                                    }else {this.addCalendarItem(week);
                                                                    }
                                                                    if (this.onSelected && typeof(this.onSelected) == "function") {
                                                                        if(celldate > dateToday || (this.today && celldate.toDateString() == dateToday.toDateString())){this.onSelected();}
                                                                    }
                                                            }.bind(this));
                                                  }
                                          }
                            }
                    }
                    
					$(cell).addClassName(this.styleNames.cell);
					if (week.getDay() == 0) { // Sunday
						$(cell).addClassName(this.styleNames.cellSunday);
					}
					if (week.getDay() == 6) { // Saturday
						$(cell).addClassName(this.styleNames.cellSaturday);
					}
					
					if (this.holidayItems.hasItem(week)) {
						$(cell).addClassName(this.styleNames.cellWeekend);
					}
					if (this.selectedItems.hasItem(week)) {
						$(cell).addClassName(this.styleNames.cellSelected);
					}


					if(sltDay > "0")
					{
					   // alert(week)
					    if (week==sltFullDate)
					    {
					       // alert(sltDay);
					       if(tid=="calendar_c3_2"){
    					        $(cell).addClassName(this.styleNames.cellSelected);
    					    }
					    }else
					    {
					        $(cell).removeClassName(this.styleNames.cellSelected);
					    }
					}
					       
				}.bind(this));
			}.bind(this));
		}
	},

	removePreviousCalendar: function() {
		var table = $(this.container);
		if (table) {
			for (var i=table.rows.length-1; i >= 0; i--) {
				var row = $(table.rows.item(i));
				var rowClassNames = row.classNames().inspect();
				//debug("rowClassNames: " + rowClassNames);
				if (rowClassNames.indexOf(this.styleNames.row) != -1) {
					table.deleteRow(i);
				}
			}
		}
	},

	generateDateArray: function() {
		var _dateArray = [];
		var _weekArray = [];

		for (var i=1; i<=31; i++) {
			var _date = new Date(this.year, this.month-1, i);
			var _month = _date.getMonth()+1;
			var _day = _date.getDay();

			if (this.month == _month) {
				// 첫번째일 경우, 일요일부터 시작하지 않으므로 빈 값들로 채운다.
				if (i == 1) {
					for (var j=0; j<_day; j++) {
						_weekArray.push(new CalendarItem(null));
					}
				}

				var calendarItem = new CalendarItem(_date);
				if (this.selectedItems.hasItem(calendarItem)) calendarItem.selected = true;
				_weekArray.push(calendarItem);
			}

			if (_weekArray.length == 7 || i == 31) {
				for (var j=_weekArray.length; j<7; j++) {
					_weekArray.push(new CalendarItem(null));
				}
				_dateArray.push(_weekArray);
				_weekArray = [];
			}
		}

		return _dateArray;
	},

	addCalendarItem: function(calendarItem) {
		this.selectedItems.addItem(calendarItem);
		calendarItem.selected = true;

		if (calendarItem.selectedCell) {
			var cell = calendarItem.selectedCell;
			if (calendarItem.isWeekend() || this.holidayItems.hasItem(calendarItem)) {
				cell.removeClassName(this.styleNames.cellWeekend);
			}
			cell.addClassName(this.styleNames.cellSelected);
		}
	},

	removeCalendarItem: function(calendarItem) {
		this.selectedItems.removeItem(calendarItem);
		calendarItem.selected = false;

		var table = $(this.container);
		table.select(this.styleNames.cell).each(function(cell) {
			if (cell.calendarItem.toString() == calendarItem.toString()) {
				if (calendarItem.isWeekend() || this.holidayItems.hasItem(calendarItem)) {
					cell.addClassName(this.styleNames.cellWeekend);
				}
				cell.removeClassName(this.styleNames.cellSelected);
			}
		}.bind(this));

		var cell = calendarItem.selectedCell;
		if (calendarItem.isWeekend() || this.holidayItems.hasItem(calendarItem)) {
			cell.addClassName(this.styleNames.cellWeekend);
		}
		cell.removeClassName(this.styleNames.cellSelected);
	},

	removeAllCalendarItems: function() {
		this.selectedItems.items.each(function(calendarItem) {
			this.removeCalendarItem(calendarItem);
		}.bind(this));
	}
}

var CalendarItem = Class.create();
CalendarItem.prototype = {

	date: null,
	selected: null,
	selectedCell: null,

	initialize: function(date) {
		this.date = date;
		this.selected = false;
	},

	isEmpty: function() {
		return (this.date == null);
	},

	isWeekend: function() {
		if (!this.isEmpty()) {
			return (this.date.getDay() == 0 || this.date.getDay() == 6);
		}
	},

	getDay: function() {
		if (this.date) {
			return this.date.getDay();
		} else {
			return -1;
		}
	},

	getDate: function() {
		if (this.date) {
			return this.date.getDate();
		}

		return "";
	},

	toString: function() {
		if (!this.isEmpty()) {
			var curDate = this.date;

			var result = "" + curDate.getFullYear();
			if (curDate.getMonth()+1 < 10) {
				result += "0" + (curDate.getMonth()+1);
			} else {
				result += (curDate.getMonth()+1);
			}
			if (curDate.getDate() < 10) {
				result += "0" + curDate.getDate();
			} else {
				result += curDate.getDate();
			}

			return result;
		}
	}
}

var CalendarItemRepository = Class.create();
CalendarItemRepository.prototype = {
	items: null,

	initialize: function() {
		this.items = [];
	},

	hasItem: function(item) {
		for (var i=0; i<this.items.length; i++) {
			var _item = this.items[i];

			if (_item.toString() == item.toString()) {
				return true;
			}
		}
		return false;
	},

	addItem: function(item) {
		if (!this.hasItem(item)) {
			this.items.push(item);
		}
	},

	removeItem: function(item) {
		if (this.hasItem(item)) {
			var newItems = [];
			for (var i=0; i<this.items.length; i++) {
				var _item = this.items[i];

				if (_item.toString() != item.toString()) {
					newItems.push(this.items[i]);
				}
			}
			this.items = newItems;
		}
	},

	removeAllItems: function() {
		while (this.items.length > 0) {
			debug("removing");
			this.items.pop();
		}
	}
};

var AirCalendar = {

	layerName: "layerCalendar2",
	iframeId: null,
	checkInId: null,
	checkOutId: null,
	nightCntId: null,
	todayFlag: false,
	zIndex: 999,
	checkInFlag: false,
	checkOutFlag: false,
	
	c3_1: null,
	c3_2: null,
	
	title_type: null,
	
	styleNames: {
		row: "calRow",
		cell: "default",                    //기본
		cellSelected: "choice",             //선택
		cellWeekend: "calCellWeekend",
		cellSaturday: "calCellSaturday",    //토요일
		cellSunday: "holiday",              //일요일
		cellLated: "calCellLated"               //비활성
	},

	setTodayFlag: function(flag) {
	    this.todayFlag = flag;
	},

	setZIndex: function(nIndex) {
	    this.zIndex = nIndex;
	},
	
	onCheckIn: function() {
	    this.checkInFlag = true;
	    this.checkOutFlag = false;
	},
	
	onCheckOut: function() {
	    this.checkOutFlag = true;
	    this.checkInFlag = false;
	},

    //CheckInId : 시작일/출발일 등 첫번째 달력 Id
    //CheckOutId : 종료일/도착일 등 두번째 달력 Id
    //NightCntId : CheckInId과 CheckOutId의 날짜 간격 Id
    //TitleType : calendar2.aspx에서 달력 제목 설정
    //ViewType : calendar2.aspx에서 달력 두 개, 한 개 visible 설정
    //AllowDayCount : 종료일 - 시작일 날짜 범위 제한
    //AllowSameDay : 가는날 오는날 같아도 되는지 여부
    //TopPos : 스타일 위치 상단
	show: function(CheckInId, CheckOutId, NightCntId, TitleType, ViewType, AllowDayCount, AllowSameDay, TopPos) {    
	
		this.checkInId = CheckInId;
	    this.checkOutId = CheckOutId;
	    this.nightCntId = NightCntId;
	    this.title_type = TitleType;
	    this.view_type = ViewType;
	    
	    if(AllowDayCount != null) allowDaysCnt = AllowDayCount;     // 오는날 선택 제한 범위
        if(AllowSameDay != null) allowSameDay = AllowSameDay;       // 가는날 오는날 같아도 되는지 여부
        titleType = TitleType;
 
		var layer = $(this.layerName);
		if (!layer) {
			layer = document.createElement("DIV");
			layer.id = this.layerName;
			layer.style.position = "absolute";
			if (this.zIndex != null) { layer.style.zIndex = this.zIndex; } // this.zIndex 처리
			document.body.appendChild(layer);
			this.loadCalendarLayer();
		}
		
		var topPos = TopPos == null ? 140 : TopPos;
		ShowPosLayer(layer.id, topPos);
        
        // 이전에 선택한 날짜 Select 처리 (2012-10-22)
        var startObj = $("td_0_" + $(CheckInId).value);
		if(startObj) startObj.click();

		var endObj = $("td_1_" + $(CheckOutId).value);
		if(endObj) endObj.click();
	},

	showIframe: function(iframeId, CheckInId, CheckOutId, NightCntId) {
	    this.iframeId = iframeId;
	    this.show(CheckInId, CheckOutId, NightCntId);
	},
	
	showIframe2: function(iframeId, CheckInId, CheckOutId, NightCntId, e) {
	    this.iframeId = iframeId;
	    this.show2(CheckInId, CheckOutId, NightCntId, e);
	},

	hide: function() {
		var layer = $(this.layerName);
		if (layer) {
		    //layer.hide();
		    var tmpinputId = $(this.checkInId);
       
            sltDay=0;
            sltFullDate=0;
            CheckInDay=0;
            ftDay=0;
            allowSameDay=false;
            document.body.removeChild(layer);
		}
		
		HideBackLayer();
	},
    sltMonthSet:function(ty,num)
    {
		        var sltCheckInYear= document.getElementById("hidSltCheckInYear").value;
		        var sltCheckOutYear= document.getElementById("hidSltCheckOutYear").value;
	            
			    if (ty=="sltYMArea01")  //가는날 달력
			    {
			    	this.c3_1.changeYearMonth(sltCheckInYear,num);
	                //this.c3_2.changeYearMonth(sltCheckInYear,num); 
			        //this.c3_2.addMonth(1);
			    }
			    else if(ty=="sltYMArea02")  //오는날 달력
			    {
	                //this.c3_1.changeYearMonth(sltCheckOutYear,num); 
	                this.c3_2.changeYearMonth(sltCheckOutYear,num);    
                    //this.c3_1.addMonth(1);
                }   
			    this.updateCaption(); 
			    $(ty).hide();
    },
	
	loadCalendarLayer: function() {
		var layer = $(this.layerName);
		if (layer) {
			// load calendar3 layer
			new Ajax.Updater(layer, "/global/ajax/calendar2.aspx?title_type=" + this.title_type + "&view_type=" + this.view_type, {
				asynchronous: false,
				method: "get"
			});

			// init calendar
			var item1 = new CalendarItemRepository();
			var item2 = new CalendarItemRepository();
			var holiday = new CalendarItemRepository();

			var prevMonth = new Date();
			
			// 선택된 날짜의 달력을 그린다 (2012-10-20) ----------------------
			var startDay = $(this.checkInId).value;
			if(startDay != "") 
			{
			    prevMonth = new Date(startDay.substring(0,4), Number(startDay.substring(4,6))-1, Number(startDay.substring(6,8)));
			}
			//---------------------------------------
			
			var prevYear = prevMonth.getFullYear();
			var prevMonth = prevMonth.getMonth() + 1;

			this.c3_1 = new Calendar("calendar_c3_1", prevYear, prevMonth, { multiple: false }, false);
			this.c3_1.selectedItems = item1;
			this.c3_1.holidayItems = holiday;
			this.c3_1.setTodayFlag(this.todayFlag);
			this.c3_1.styleNames.cellSaturday   = this.styleNames.cellSaturday;
		    this.c3_1.styleNames.cellSunday     = this.styleNames.cellSunday;
		    this.c3_1.styleNames.cellLated      = this.styleNames.cellLated;
			this.c3_1.generateCalendar();
			
			// 선택된 날짜의 달력을 그린다 (2012-10-20) ----------------------
			var endDay = $(this.checkOutId).value;
			if(endDay != "")
			{
			    endDay = new Date(endDay.substring(0,4), Number(endDay.substring(4,6))-1, Number(endDay.substring(6,8)));
			    prevYear = endDay.getFullYear();
			    prevMonth = endDay.getMonth() + 1;
			}
			//---------------------------------------
			
			this.c3_2 = new Calendar("calendar_c3_2", prevYear, prevMonth, { multiple: false }, false);
			//this.c3_2.addMonth(1);
			this.c3_2.selectedItems = item2;
			this.c3_2.holidayItems = holiday;
			this.c3_2.setTodayFlag(this.todayFlag);
			this.c3_2.generateCalendar();
			
			this.c3_1.onSelected = this.onSelected.bind(this);
			this.c3_2.onSelected = this.onSelected.bind(this);
			this.c3_2.onSelected2 = this.onSelected2.bind(this);

			this.updateCaption();

			$("btn_c3prev_1").observe("click", function() {
				this.c3_1.previousMonth(-1);
				//this.c3_2.previousMonth(-1);

				this.updateCaption();
			}.bind(this));

			$("btn_c3next_1").observe("click", function() {
				this.c3_1.nextMonth(1);
				//this.c3_2.nextMonth(1);

				this.updateCaption();
			}.bind(this));
			
			$("btn_c3prev_2").observe("click", function() {
				//this.c3_1.previousMonth(-1);
				this.c3_2.previousMonth(-1);

				this.updateCaption();
			}.bind(this));

			$("btn_c3next_2").observe("click", function() {
				//this.c3_1.nextMonth(1);
				this.c3_2.nextMonth(1);

				this.updateCaption();
			}.bind(this));
/*
	       var sltNightId = document.getElementById("sltNight");  
	       var tmpNightCntId =null;
	       tmpNightCntId = $(this.nightCntId);	     
	       for(var j = 0; j < sltNightId.length; j++)
           {
               if( sltNightId.options[j].value== tmpNightCntId.value)
                {
                     sltNightId.options[j].selected=true;    
                }
           }
*/
		   CenterLayer(this.layerName);
		}
	},
	/*
    SltNightChange:function(){
           var sltNightId = document.getElementById("sltNight");  
	       var tmpNightCntId =null;
	       tmpNightCntId = $(this.nightCntId);	
	       
	       for(var j = 0; j < tmpNightCntId.length; j++)
           {
               if( tmpNightCntId.options[j].value== sltNightId.value)
                {
                     tmpNightCntId.options[j].selected=true;   
                }
           }

           refreshSelect(this.nightCntId);
           
           if (CheckInDay>0)
           {
                //this.inputId.value =CheckInDay;
                var tmpinputOutId = $(this.checkOutId);	

                yyyy_ = CheckInDay.getFullYear();
                mm_ = (CheckInDay.getMonth())<10? "0" + (CheckInDay.getMonth()) : (CheckInDay.getMonth()) ;
                dd_ = CheckInDay.getDate()<10 ? "0" + CheckInDay.getDate() : CheckInDay.getDate();
                      
                var tmpString =   yyyy_+''+mm_+''+dd_;
                    
                var dt3_ = addDay(tmpString,sltNightId.value); //20120501
                     
                      
                //선택 박수 더한 날짜
                var  sltmm =  dt3_.substr(4,2) ;
                if (mm_ < sltmm ) {
                            this.c3_2.addMonth(1);
                }  
                         
                tmpinputOutId.value=dt3_;
                
                sltDay = (dt3_.substr(6,2));
                sltFullDate= dt3_;
                this.c3_2.changeYearMonth(dt3_.substr(0,4),sltmm); 
                this.updateCaption();
                     
                //compareId.value =dt3_;
           }
    },
    */
	onSelected: function() {
	    var inputId = null;
        var compareId = null;
        var nightCntId = null;
        var inputValue = null;
        var compareValue = null;
        var nightCntValue = null;
        
	    if (this.iframeId) 
	    {

	    } 
	    else 
	    {    
	        nightCntId = $(this.nightCntId);
		    inputId = $(this.checkInId);
		    compareId = $(this.checkOutId);
         
            if(this.c3_1.selectedItems.items[0]){
                 
                 inputValue = this.c3_1.selectedItems.items[0].toString();

                 var ymd = inputValue;
                 var v_day = nightCntId.value;
                 var yyyy = ymd.substr(0,4);
                 var mm = ymd.substr(4,2);
                 var dd = ymd.substr(6,2);
                 
                 var tmpDT = new Date(yyyy, mm - 1, dd);
                 CheckInDay =  tmpDT;  //선택한날짜

                 // ftDay = new Date(yyyy, mm, eval(dd+'+'+15));
                 ftDay = addDay(inputValue, allowDaysCnt); //20120501
                 ftDay = new Date(ftDay.substr(0,4), ftDay.substr(4,2) - 1, ftDay.substr(6,2));  //
                 
                 var dt3 = addDay(inputValue,v_day); //20120501
                 
                 yyyy_ = dt3.substr(0,4)
                 mm_ = dt3.substr(4,2) ;
                 dd_ = dt3.substr(6,2);
                  
                if (mm < mm_) {
                    this.c3_2.addMonth(1);
                }     
                  
                // var tmpDT = new Date(yyyy, mm, eval(dd + '+' + 15));

                sltDay = dd_;
                sltFullDate = dt3;
                 
                this.c3_2.changeYearMonth(yyyy_,mm_); 
                this.updateCaption();
                 
                inputId.value = inputValue;  //체크인
                compareId.value = dt3;
                //alert(inputValue);
                document.getElementById("hidCheckInDate").value=inputValue;
            }
             
            //오는날 선택 값 있을 경우(1. 가는 날 없이 오는 날 클릭 시 2. 오는 날 선택 후 가는 날 클릭 시)
            if(this.c3_2.selectedItems.items[0]){
                
                // compareId.value =this.c3_2.selectedItems.items[0]; 
                return false;
            }      
        }
	},
	//가는 날 선택 후 오는날 선택 시
	onSelected2: function() {
	    var inputId = null;
        var compareId = null;
        var nightCntId = null;
        var inputValue = null;
        var compareValue = null;
        var nightCntValue = null;
        
	    // 가는날 날짜 선택시~
	    nightCntId = $(this.nightCntId);
		inputId = $(this.checkInId);
		compareId = $(this.checkOutId);
         
        var yyyy_ = CheckInDay.getFullYear();
        var  mm_ = (CheckInDay.getMonth() + 1)<10? "0" + (CheckInDay.getMonth() + 1) : (CheckInDay.getMonth() + 1) ;
        var  dd_ = CheckInDay.getDate()<10 ? "0" + CheckInDay.getDate() : CheckInDay.getDate();
		  
		//가는날-오는날: 날짜 수
		var aa = checkTerm(this.c3_2.selectedItems.items[0].toString(), yyyy_+''+mm_+''+dd_);

            if(this.c3_1.selectedItems.items[0]){
                inputValue=this.c3_1.selectedItems.items[0].toString();

                var ymd = inputValue;
                var v_day = nightCntId.value;
                var yyyy = ymd.substr(0,4);
                var mm = ymd.substr(4,2) ;
                var dd = ymd.substr(6,2);
                 
                var tmpDT = new Date(yyyy, mm - 1, dd);
                CheckInDay =  tmpDT;  //선택한날짜

                // ftDay = new Date(yyyy, mm, eval(dd+'+'+15));
                ftDay = addDay(inputValue, allowDaysCnt); //기본 15일 까지만 선택하도록 되어 있음 (generateCalendar 에서 현재 조건 풀었음. 혹시 몰라서 일단 남겨둠.)
                ftDay = new Date(ftDay.substr(0,4), ftDay.substr(4,2) - 1, ftDay.substr(6,2));  //
                 
                //var dt3 = addDay(inputValue,v_day); //20120501
                var dt3 = addDay(inputValue,aa);
                 
                yyyy_ = dt3.substr(0,4)
                mm_ = dt3.substr(4,2) ;
                dd_ = dt3.substr(6,2);
                  
                if (mm < mm_) {
                    this.c3_2.addMonth(1);
                }     
                sltDay = dd_;
                sltFullDate = dt3;
                 
                this.c3_2.changeYearMonth(yyyy_,mm_); 
                this.updateCaption();
    
                inputId.value = inputValue;
                 
                var tmpinputOutId = $(this.checkOutId);	
                tmpinputOutId.value=dt3;    
                 
                // 추가 (20121020)
                var date1 = new Date(inputValue.substr(0,4),inputValue.substr(4,2)-1,inputValue.substr(6,2));
                var date2 = new Date(dt3.substr(0,4),dt3.substr(4,2)-1,dt3.substr(6,2));

			    var nDiff = (date2.valueOf() - date1.valueOf()) / 86400000;
			    $(this.nightCntId).value = nDiff;
			    
			    if($(this.nightCntId).tagName.toLowerCase() == "select")
			        refreshSelect(this.nightCntId);
             }
             
            if(this.c3_2.selectedItems.items[0]){

            }
	},

	updateCaption: function() {
		$("txt_date01").innerHTML = "<strong><a href='javascript:AirCalendar.sltYMAreaShowHide(1)';>"+ this.c3_1.year + "." + this.c3_1.month+"<img  src='http://openimage.interpark.com/tourpark/tour/common/popup/btn_down.gif' alt='' /></a></strong>";
		$("txt_date02").innerHTML = "<strong><a href='javascript:AirCalendar.sltYMAreaShowHide(2)';>"+ this.c3_2.year + "." + this.c3_2.month+"<img  src='http://openimage.interpark.com/tourpark/tour/common/popup/btn_down.gif' alt='' /></a></strong>";
	},
	
	sltYMAreaHide:function(lid){

	    if(lid==1)
	         $('sltYMArea01').hide();
	    else if(lid == 2)
	         $('sltYMArea02').hide();
	    else
	         $(lid).hide();
	},
	
	sltYMAreaShowHide:function(lid){
	
        var obj = $('sltYMArea0' + lid);
        
        if(obj.style.display == "none")
            obj.show();
        else
            obj.hide();
	            
        /*	            
	    if (lid==1)
	        $('sltYMArea01').show();
	    else if(lid==2)
	        $('sltYMArea02').show();
	    */
    },
    sltYearSet:function(ty,num){
	        
	    if(ty=="in"){
	        if(document.getElementById("hidSltCheckInYear").value!=num)
	        {
	            $('CheckInYear'+num).addClassName("on");
	            //alert($('CheckInYear'+num).id +'--'+$('CheckInYear'+document.getElementById("hidSltCheckInYear").value).id)
	            $('CheckInYear'+document.getElementById("hidSltCheckInYear").value).removeClassName("on");

	            document.getElementById("hidSltCheckInYear").value=num;
	        }
	    }else
	    {
	      	if(document.getElementById("hidSltCheckOutYear").value!=num)
	        {
	            $('CheckOutYear'+num).addClassName("on");
	            $('CheckOutYear'+document.getElementById("hidSltCheckOutYear").value).removeClassName("on");
	            document.getElementById("hidSltCheckOutYear").value=num;
	        }  
	    }
	}
}


    function calDateRange(val1, val2)
    {
        var FORMAT = "-";

        // FORMAT을 포함한 길이 체크
        if (val1.length != 10 || val2.length != 10)
            return null;
 
        // FORMAT이 있는지 체크
        if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
            return null;
 
        // 년도, 월, 일로 분리
        var start_dt = val1.split(FORMAT);
        var end_dt = val2.split(FORMAT);
 
 
        // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
        // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
        start_dt[1] = (Number(start_dt[1]) - 1) + "";
        end_dt[1] = (Number(end_dt[1]) - 1) + "";
 
        var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
        var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
 
        return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
    }


// return 개월차이
function calMonthRange(val1, val2) {
    if (val1.length != 6 || val2.length != 6)
        return null;

    var val3 = val1.substring(0,4)+"-"+val1.substring(4,6);
    var val4 = val2.substring(0,4)+"-"+val2.substring(4,6);

    // 년도, 월, 일로 분리
    var start_dt = val3.split("-");
    var end_dt = val4.split("-");

    // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
    // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
    start_dt[1] = (Number(start_dt[1]) - 1) + "";
    end_dt[1] = (Number(end_dt[1]) - 1) + "";

    var from_dt = new Date(start_dt[0], start_dt[1], '01');
    var to_dt = new Date(end_dt[0], end_dt[1], '01');

    var reVal = 0;
    if(start_dt[0]==end_dt[0]) { // 년도가 같다면
        reVal = end_dt[1] - start_dt[1] + 1;
    } else {
        reVal = ((end_dt[0] - start_dt[0])*12) + (end_dt[1] - start_dt[1]) + 1;
    }
    return reVal;
}


function checkTerm(eDate, sDate)
{
    var eDateYear = parseInt(eDate.substring(2,4),10);
    var eDateMonth = parseInt(eDate.substring(4,6),10);
    var eDateDate = parseInt(eDate.substring(6,8),10);

    var sDateYear = parseInt(sDate.substring(2,4),10);
    var sDateMonth = parseInt(sDate.substring(4,6),10);
    var sDateDate = parseInt(sDate.substring(6,8),10);

    var eDate = new Date(eDateYear, eDateMonth-1, eDateDate);
    var sDate = new Date(sDateYear, sDateMonth-1, sDateDate);

    var differ = (((((eDate - sDate)/1000)/60)/60)/24);
    return differ;
}


function addDay(ymd,v_day){
    var yyyy = ymd.substring(0,4);
    var mm = eval(ymd.substring(4,6)+"-1");
    var dd = ymd.substring(6);
    var dt3 = new Date(yyyy,mm,eval(dd+'+'+v_day));
    yyyy = dt3.getFullYear();
    mm = (dt3.getMonth()+1)<10?"0"+(dt3.getMonth()+1):(dt3.getMonth()+1);
    dd = dt3.getDate()<10?"0"+dt3.getDate():dt3.getDate();
    return "" + yyyy + "" + mm + "" + dd;
}

/*// 날짜를 yyyyMMdd 로 반환
function dateFormatting(input) {

    var year = String(input.getFullYear());
    var month = String(input.getMonth() + 1);
    var day = String(input.getDate());
 
    if(month.length == 1) month = "0" + month;
    if(day.length == 1) day = "0" + day;
 
    var formatString = year + month + day;
 
    return formatString;
}
*/

function addDay2(ymd, v_day){
    var date = new Date(ymd.getFullYear(), ymd.getMonth(), ymd.getDate());
    date.setDate(date.getDate() + v_day);
    return date;
}