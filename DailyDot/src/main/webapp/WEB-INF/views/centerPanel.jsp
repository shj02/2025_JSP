<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .todoType .btn {
        font-size: 12px;
    }
</style>

<div class="center-panel" style="padding: 15px;">

    <div class="title" style="font-weight: bold; font-size: 32px;">
        DailyDot 
        <span id="dateDisplay" style="font-size: 16px; font-weight: normal; color: gray; margin-left: 2px;"></span>
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
    <div id="completeMsg" style="display: none; text-align: center; margin-top: 10px; color: green; font-size: 18px;">
        오늘의 Dot 모두 완료!
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
            
            const completeMsg = document.getElementById('completeMsg');

            if (total === 0) {
                progressBar.style.width = '0%';
                progressEl.setAttribute('aria-valuenow', '0');
                if (completeMsg) completeMsg.style.display = 'none'; 
                return;
            }

            let done = 0;
            checkboxes.forEach(function(cb) {
                if (cb.checked) done++;
            });

            const percent = Math.round((done / total) * 100);
            progressBar.style.width = percent + '%';
            progressEl.setAttribute('aria-valuenow', String(percent));

            if (completeMsg) {
                if (percent === 100) {
                    completeMsg.style.display = 'block';
                } else {
                    completeMsg.style.display = 'none';
                }
            }
        }

     
        window.loadTodos = function(selectedDate) {
            
            // 오늘 날짜 구하기
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0');
            const todayStr = year + '-' + month + '-' + day; 
            
            const progressContainer = document.querySelector('.progress');
            const completeMsg = document.getElementById('completeMsg');

            // 화면에 날짜 표시
            const dateEl = document.getElementById('dateDisplay');
            if (dateEl) {
                const displayDate = selectedDate ? selectedDate : todayStr;
                dateEl.textContent = displayDate;
            }

            // 편집 가능 여부 판단
            let isEditable = false;
            if (!selectedDate || selectedDate === todayStr) {
                isEditable = true;
            }
            
            if (progressContainer) {
                if (isEditable) {
                    progressContainer.style.visibility = 'visible';
                } else {
                    progressContainer.style.visibility = 'hidden';
                    if (completeMsg) completeMsg.style.display = 'none';
                }
            }

            let url = '/todo/list';
            if (selectedDate) {
                url += '?date=' + selectedDate;
            } 

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    listEl.innerHTML = ''; 

                    if (data.length === 0) {
                        listEl.innerHTML = '<div class="text-center text-muted mt-3">No dots for this day.</div>';
                        if(isEditable) updateProgress();
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
                        
                        // 오늘만 완료 표시 적용
                        if(isEditable && todo.completed) {
                            item.classList.add('todo-done');
                        }

                        // 오늘만 체크박스 생성
                        if (isEditable) {
                            const checkbox = document.createElement('input');
                            checkbox.type = 'checkbox';
                            checkbox.className = 'form-check-input me-2 todo-check';
                            checkbox.checked = todo.completed;
                            checkbox.dataset.id = todo.todoId;
                            item.appendChild(checkbox);
                        } else {
                        	
                        }

                        const span = document.createElement('span');
                        span.className = 'todo-text';
                        span.innerHTML = emoji + ' ' + todo.content + dotHtml;
                        
                        item.appendChild(span);

                        // 오늘만 삭제 버튼 생성
                        if (isEditable) {
                            const delBtn = document.createElement('button');
                            delBtn.type = 'button';
                            delBtn.className = 'btn btn-sm text-danger todo-delete ms-auto border-0 bg-transparent p-0';
                            delBtn.textContent = '🗑️';
                            
                            delBtn.dataset.id = todo.todoId; 
                            delBtn.dataset.date = selectedDate ? selectedDate : todayStr;
                            
                            item.appendChild(delBtn);
                        }

                        listEl.appendChild(item);
                    });

					// 오늘만 진행률 업데이트
                    if (isEditable) {
                        updateProgress();
                    }
                })
                .catch(err => console.error("리스트 로드 실패:", err));
        };
        window.loadTodos();

        if (listEl) {
            Sortable.create(listEl, {
                animation: 150,
                handle: null,
                onEnd: function(evt) {
                    console.log('이전 인덱스:', evt.oldIndex, '새 인덱스:', evt.newIndex);
                }
            });

            listEl.addEventListener('change', function(e) {
                const target = e.target;
                if (!(target instanceof HTMLInputElement)) return;
                if (!target.classList.contains('todo-check')) return;

                const item = target.closest('.list-group-item');
                const todoId = target.dataset.id; 
                const isChecked = target.checked;

                if (item && todoId) {
                    if (isChecked) {
                        item.classList.add('todo-done');
                    } else {
                        item.classList.remove('todo-done');
                    }
                    updateProgress();

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

            
            listEl.addEventListener('click', function(e) {
                const target = e.target;
                if (!(target instanceof HTMLElement)) return;

                const delBtn = target.closest('.todo-delete');
                if (!delBtn) return;

                const item = delBtn.closest('.list-group-item');
                if (!item) return;
                
                // 삭제할 투두의 ID 가져옴
                const todoId = delBtn.dataset.id;
                
                // 날짜 정보 가져옴
                const dateStr = delBtn.dataset.date;
                
                // 서버에 삭제 요청 보냄
                if (todoId) {
                    if(!confirm('정말 삭제하시겠습니까?')) return;

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
                        loadTodos(); 
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

