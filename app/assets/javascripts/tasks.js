$(document).ready(function() {
  listenForMark();
});

function listenForMark() {
  // Use delegate in order to catch anything that is added to the page without a refresh.
  $('.mark-as').on('click', function(event) {
    event.preventDefault();
    var $task = $(event.target).closest('.task');
    if ($task.hasClass('incomplete')) {
      updateTask($task, true);
      $task.find('#task-status').text('complete');
      $task.find('.mark-as').text('Mark as incomplete');
      $task.removeClass('incomplete');
      $task.addClass('complete');
    } else {
      updateTask($task, false);
      $task.find('#task-status').text('incomplete');
      $task.find('.mark-as').text('Mark as complete');
      $task.removeClass('complete');
      $task.addClass('incomplete');
    }
  })
}

function updateTask(task, updated_status) {
  $.ajax({
    type: 'PUT',
    url: '/api/v1/tasks/' + task.attr('data-id') + '.json',
    data: {task: {complete: updated_status}}
  })
}
