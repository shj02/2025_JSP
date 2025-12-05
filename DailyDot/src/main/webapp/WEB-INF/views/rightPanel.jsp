<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.css" rel="stylesheet"/>

<style>
    .right-panel {
        padding: 15px 0 15px 15px;
        font-family: 'Galmuri11', sans-serif;
    }

    .right-panel img {
        width: 100%;
        height: auto;
        display: block;
    }

    #calendar {
        width: 100%;
        height: 460px;
        font-size: 10px;
    }

	.fc .fc-daygrid-day-number {
        color: #000000 !important; /* 글자색: 진한 회색 (검정) */
        text-decoration: none !important; /* 밑줄 제거 */
        font-weight: bold; /* (선택) 글자 굵게 */
    }
    
    /* 기본 배경색 */
    .fc .fc-col-header-cell {
        background-color: #000000;
        transition: background-color 0.3s ease; /* 색상 바뀔 때 부드럽게 */
    }
    .fc .fc-daygrid-day.fc-day-today {
        background-color: #a2a3a2;
    }
    .fc-daygrid-day.selected-date {
        box-shadow: inset 0 0 0 2px #000000 !important;
    }
    .fc .fc-col-header-cell-cushion {
        font-size: 10px;
        color: #000000 !important;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.2); 
        text-decoration: none !important; /* 밑줄 제거 */
    }
    .fc .fc-daygrid-day-number {
        font-size: 10px;
        font-weight: bold;
    }
    .fc .fc-toolbar.fc-header-toolbar {
        margin-bottom: 4px;
    }

    /* 봄 */
    .right-panel.spring .fc .fc-col-header-cell {
        background: linear-gradient(to right, #de6fa6, #d99cba) !important;
    }

    /* 여름 */
    .right-panel.summer .fc .fc-col-header-cell {
        background: linear-gradient(to right, #0dcaf0, #76d5e8) !important;
    }

    /* 가을 */
    .right-panel.autumn .fc .fc-col-header-cell {
        background: linear-gradient(to right, #ffc107, #e6ca77) !important;
    }

    /* 겨울 */
    .right-panel.winter .fc .fc-col-header-cell {
        background: linear-gradient(to right, #adb5bd, #edf4fa) !important;
    }
</style>


<div class="right-panel ${season }">
    <img src="/image/${season}.gif" alt="season">
    <div id="calendarWrapper" style="margin-top: 15px;">
        <div id="calendar"></div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar');

        const calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            
            dateClick: function(info) {
                const dateStr = info.dateStr;
                console.log('선택된 날짜:', dateStr);

                // [추가] 1. 기존에 테두리 쳐진 날짜들 찾아서 원상복구 (초기화)
                const prevSelected = document.querySelectorAll('.selected-date');
                prevSelected.forEach(function(el) {
                    el.classList.remove('selected-date');
                });

                // [추가] 2. 방금 클릭한 날짜(info.dayEl)에 테두리 클래스 추가
                if (info.dayEl) {
                    info.dayEl.classList.add('selected-date');
                }
                
                // 3. 기존 기능: 투두 리스트 불러오기
                if (window.loadTodos) {
                    window.loadTodos(dateStr);
                } else {
                    console.error("loadTodos 함수를 찾을 수 없습니다.");
                }
            }
        });

        calendar.render();
    });
</script>
