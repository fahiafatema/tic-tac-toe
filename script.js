const addButton = document.getElementById('add-btn');
const todoInput = document.getElementById('todo-input');
const todoList = document.getElementById('todo-list');

addButton.addEventListener('click', addTodo);

function addTodo() {
    const taskText = todoInput.value.trim();
    if (taskText === '') return;

    const listItem = document.createElement('li');
    listItem.className = 'todo-item';

    const taskSpan = document.createElement('span');
    taskSpan.textContent = taskText;
    listItem.appendChild(taskSpan);

    const completeButton = document.createElement('button');
    completeButton.textContent = 'Complete';
    completeButton.className = 'complete';
    completeButton.onclick = () => {
        listItem.classList.toggle('completed');
    };
    listItem.appendChild(completeButton);

    const editButton = document.createElement('button');
    editButton.textContent = 'Edit';
    editButton.className = 'edit';
    editButton.onclick = () => {
        const newTask = prompt('Edit your task:', taskSpan.textContent);
        if (newTask) taskSpan.textContent = newTask.trim();
    };
    listItem.appendChild(editButton);

    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.className = 'delete';
    deleteButton.onclick = () => {
        listItem.remove();
    };
    listItem.appendChild(deleteButton);

    todoList.appendChild(listItem);
    todoInput.value = '';
}
