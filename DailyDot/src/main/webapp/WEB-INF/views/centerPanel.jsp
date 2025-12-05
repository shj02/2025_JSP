<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .todoType .btn {
        font-size: 12px;
    }
</style>

<div class="center-panel" style="padding: 15px;">

    <div class="title" style="font-weight: bold; font-size: 32px;">
        DailyDot 
        <span id="dateDisplay" style="font-size: 16px; font-weight: normal; color: gray; margin-left: 5px;"></span>
    </div>

    <!-- 입력 + 추가 버튼 -->
    <form id="todoForm" action="">
        <div class="insertTodo d-flex align-items-center gap-2" style="padding-top: 20px;">
            <input
                id="todoInput"
                class="form-control border border-2 border-dark"
                type="text"
                placeholder="What's your dot for today?"
            >
            <button type="submit" class="btn btn-dark" style="width: 100px;">+</button>
        </div>
    </form>

    <!-- RepeatRule + Category -->
    <div class="todoType" style="padding-top: 13px;">
        <div class="btn-group border border-1 border-dark" role="group" aria-label="Repeat type">
            <input type="radio" class="btn-check" name="todoType" id="today" autocomplete="off" checked>
            <label class="btn btn-outline-dark" for="today">Today</label>

            <input type="radio" class="btn-check" name="todoType" id="daily" autocomplete="off">
            <label class="btn btn-outline-dark" for="daily">Daily</label>

            <input type="radio" class="btn-check" name="todoType" id="weekly" autocomplete="off">
            <label class="btn btn-outline-dark" for="weekly">Weekly</label>

            <input type="radio" class="btn-check" name="todoType" id="monthly" autocomplete="off">
            <label class="btn btn-outline-dark" for="monthly">Monthly</label>
        </div>

        <div class="btn-group border border-1 border-dark" role="group" aria-label="Category">
            <input type="radio" class="btn-check" name="todoCategory" id="cat-study" autocomplete="off" checked>
            <label class="btn btn-outline-dark" for="cat-study">Study</label>

            <input type="radio" class="btn-check" name="todoCategory" id="cat-task" autocomplete="off">
            <label class="btn btn-outline-dark" for="cat-task">Task</label>

            <input type="radio" class="btn-check" name="todoCategory" id="cat-health" autocomplete="off">
            <label class="btn btn-outline-dark" for="cat-health">Health</label>

            <input type="radio" class="btn-check" name="todoCategory" id="cat-etc" autocomplete="off">
            <label class="btn btn-outline-dark" for="cat-etc">Etc</label>
        </div>
    </div>

    <!-- todoList -->
    <div class="todoListWrapper" style="margin-top: 20px;">
        <div id="todoList" class="list-group">
            <div class="list-group-item d-flex align-items-center">
                <input class="form-check-input me-2 todo-check" type="checkbox">
                <span class="todo-text">📑 오늘의 DailyDot 한 가지 쓰기</span>
                <button
                    type="button"
                    class="btn btn-sm text-danger todo-delete ms-auto border-0 bg-transparent p-0">🗑️</button>
            </div>
            <div class="list-group-item d-flex align-items-center">
                <input class="form-check-input me-2 todo-check" type="checkbox">
                <span class="todo-text">📖 JSP 과제하기</span>
                <button
                    type="button"
                    class="btn btn-sm text-danger todo-delete ms-auto border-0 bg-transparent p-0">🗑️</button>
            </div>
            <div class="list-group-item d-flex align-items-center">
                <input class="form-check-input me-2 todo-check" type="checkbox">
                <span class="todo-text">🥗 운동 30분</span>
                <button
                    type="button"
                    class="btn btn-sm text-danger todo-delete ms-auto border-0 bg-transparent p-0">🗑️</button>
            </div>
            <div class="list-group-item d-flex align-items-center">
                <input class="form-check-input me-2 todo-check" type="checkbox">
                <span class="todo-text">🫧 다이어리 쓰기</span>
                <button
                    type="button"
                    class="btn btn-sm text-danger todo-delete ms-auto border-0 bg-transparent p-0">🗑️</button>
            </div>
        </div>
    </div>

    <!-- progressBar -->
    <div
        class="progress"
        role="progressbar"
        aria-label="Todo progress"
        aria-valuenow="0"
        aria-valuemin="0"
        aria-valuemax="100"
        style="margin-top: 30px; height: 20px;"
    >
        <div class="progress-bar bg-dark" style="width: 0%;"></div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.2/Sortable.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const listEl = document.getElementById('todoList');
        const formEl = document.getElementById('todoForm');
        const inputEl = document.getElementById('todoInput');
        const progressBar = document.querySelector('.progress-bar');
        const progressEl = document.querySelector('.progress');

        function updateProgress() {
            if (!listEl || !progressBar || !progressEl) return;

            const checkboxes = listEl.querySelectorAll('.todo-check');
            const total = checkboxes.length;
            if (total === 0) {
                progressBar.style.width = '0%';
                progressEl.setAttribute('aria-valuenow', '0');
                return;
            }

            let done = 0;
            checkboxes.forEach(function(cb) {
                if (cb.checked) done++;
            });

            const percent = Math.round((done / total) * 100);
            progressBar.style.width = percent + '%';
            progressEl.setAttribute('aria-valuenow', String(percent));
        }

     
        window.loadTodos = function(selectedDate) {
            
            // 1. 오늘 날짜 구하기
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0');
            const todayStr = year + '-' + month + '-' + day; // "2025-12-05"

            // 2. [수정됨] 화면에 날짜 표시하기 (크기 조절 가능)
            const dateEl = document.getElementById('dateDisplay');
            if (dateEl) {
                // 선택된 날짜가 있으면 그걸 쓰고, 없으면(처음 켤 때) 오늘 날짜를 씁니다.
                const displayDate = selectedDate ? selectedDate : todayStr;
                dateEl.textContent = '(' + displayDate + ')';
            }

            // 3. 편집 가능 여부 판단
            let isEditable = false;
            if (!selectedDate || selectedDate === todayStr) {
                isEditable = true;
            }

            let url = '/todo/list';
            if (selectedDate) {
                url += '?date=' + selectedDate;
                // [삭제됨] 기존의 titleEl.textContent 변경 코드는 이제 필요 없습니다.
            }

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    listEl.innerHTML = ''; 

                    if (data.length === 0) {
                        listEl.innerHTML = '<div class="text-center text-muted mt-3">No Dots...</div>';
                        updateProgress();
                        return;
                    }

                    data.forEach(todo => {
                        let emoji = '📚';
                        if (todo.category === 'Task') emoji = '📑';
                        else if (todo.category === 'Health') emoji = '🥗';
                        else if (todo.category === 'Etc') emoji = '🫧';

                        let dotHtml = '';
                        if (todo.repeatRule === 'daily') {
                             dotHtml = ' <span style="color: green; font-weight: bold;">•</span>';
                        } else if (todo.repeatRule === 'weekly') {
                             dotHtml = ' <span style="color: red; font-weight: bold;">•</span>';
                        } else if (todo.repeatRule === 'monthly') {
                             dotHtml = ' <span style="color: blue; font-weight: bold;">•</span>';
                        }

                        const item = document.createElement('div');
                        item.className = 'list-group-item d-flex align-items-center';
                        
                        // 완료된 항목 스타일
                        if(todo.completed) item.classList.add('todo-done');

                        const checkbox = document.createElement('input');
                        checkbox.type = 'checkbox';
                        checkbox.className = 'form-check-input me-2 todo-check';
                        checkbox.checked = todo.completed;
                        checkbox.dataset.id = todo.todoId;

                        const span = document.createElement('span');
                        span.className = 'todo-text';
                        span.innerHTML = emoji + ' ' + todo.content + dotHtml;

                        // [핵심 기능] 오늘이 아니면 편집 제한
                        if (!isEditable) {
                            checkbox.disabled = true;       // 체크박스 잠금
                            item.style.opacity = '0.6';     // 전체적으로 흐리게
                        }

                        item.appendChild(checkbox);
                        item.appendChild(span);

                        // [핵심 기능] 오늘일 때만 삭제 버튼 추가
                        if (isEditable) {
                            const delBtn = document.createElement('button');
                            delBtn.type = 'button';
                            delBtn.className = 'btn btn-sm text-danger todo-delete ms-auto border-0 bg-transparent p-0';
                            delBtn.textContent = '🗑️';
                            
                            // 삭제 버튼에도 ID 심어두기 (나중을 위해)
                            delBtn.dataset.id = todo.todoId; 
                         
                            delBtn.dataset.date = selectedDate ? selectedDate : todayStr;
                            item.appendChild(delBtn);
                        }

                        listEl.appendChild(item);
                    });
                    
                    updateProgress();
                })
                .catch(err => console.error("리스트 로드 실패:", err));
        };

        // 페이지 로드 시 실행 (맨 아래에 있던 loadTodos() 대신 이거 사용)
        window.loadTodos();

        if (listEl) {
            Sortable.create(listEl, {
                animation: 150,
                handle: null,
                onEnd: function(evt) {
                    console.log('이전 인덱스:', evt.oldIndex, '새 인덱스:', evt.newIndex);
                }
            });

            // 체크박스 변경 이벤트 (수정됨)
            listEl.addEventListener('change', function(e) {
                const target = e.target;
                if (!(target instanceof HTMLInputElement)) return;
                if (!target.classList.contains('todo-check')) return;

                const item = target.closest('.list-group-item');
                const todoId = target.dataset.id; // 아까 loadTodos에서 심어둔 ID 가져오기
                const isChecked = target.checked; // 체크 여부 (true/false)

                if (item && todoId) {
                    // 1. 화면 스타일 먼저 변경 (반응 속도를 위해)
                    if (isChecked) {
                        item.classList.add('todo-done');
                    } else {
                        item.classList.remove('todo-done');
                    }
                    updateProgress(); // 진행률 업데이트

                    // 2. 서버에 저장 요청 (AJAX)
                    fetch('/todo/updateStatus', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: 'todoId=' + todoId + '&isCompleted=' + isChecked
                    })
                    .then(response => response.text())
                    .then(result => {
                        if (result !== 'success') {
                            alert('상태 저장 실패');
                            // 실패하면 체크박스 원상복구
                            target.checked = !isChecked;
                            if (!isChecked) item.classList.add('todo-done');
                            else item.classList.remove('todo-done');
                        } else {
                            console.log('상태 저장 완료:', todoId, isChecked);
                        }
                    })
                    .catch(err => console.error(err));
                }
            });

         // centerPanel.jsp 스크립트 내부

            // 삭제 버튼 이벤트 (수정됨)
            listEl.addEventListener('click', function(e) {
                const target = e.target;
                if (!(target instanceof HTMLElement)) return;

                const delBtn = target.closest('.todo-delete');
                if (!delBtn) return;

                const item = delBtn.closest('.list-group-item');
                if (!item) return;
                
                // 1. 삭제할 투두의 ID 가져오기
                const todoId = delBtn.dataset.id;
                
                // 날짜 정보 가져오기
                const dateStr = delBtn.dataset.date;
                
                // 2. 서버에 삭제 요청 보내기
                if (todoId) {
                    if(!confirm('정말 삭제하시겠습니까?')) return; // (선택사항) 실수 방지용 확인창

                    fetch('/todo/delete', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: 'todoId=' + todoId + '&date=' + dateStr
                    })
                    .then(response => response.text())
                    .then(result => {
                        if (result === 'success') {
                            // 3. 서버 삭제 성공 시 화면에서도 제거
                            item.remove();
                            updateProgress();
                            console.log('삭제 완료:', todoId);
                            
                            if (listEl.children.length === 0) {
                                listEl.innerHTML = '<div class="text-center text-muted mt-3">No Dots...</div>';
                            }
                        } else {
                            alert('삭제에 	실패했습니다.');
                        }
                    })
                    .catch(err => console.error('삭제 요청 오류:', err));
                }
            });
        }

        if (formEl && inputEl && listEl) {
            formEl.addEventListener('submit', function(e) {
                e.preventDefault();

                const text = inputEl.value.trim();
                if (!text) return;

                const selectedCategory = document.querySelector('input[name="todoCategory"]:checked');
                const selectedType = document.querySelector('input[name="todoType"]:checked');

                const categoryId = selectedCategory ? selectedCategory.id : 'cat-study';
                const typeId = selectedType ? selectedType.id : 'today';

                // AJAX 요청 부분 (기존과 동일)
                fetch('/todo/add', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'content=' + encodeURIComponent(text) + 
                          '&category=' + categoryId + 
                          '&type=' + typeId
                })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        loadTodos(); // [중요] 저장 성공하면 목록 다시 불러오기 (화면 갱신)
                        inputEl.value = '';
                    } else {
                        alert('저장 실패');
                    }
                })
                .catch(error => console.error('Error:', error));
            });
        }
    });
</script>

