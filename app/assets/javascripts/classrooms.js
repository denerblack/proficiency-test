var classroomCenter = angular.module('ClassroomCenter', ['ngResource']);

classroomCenter.factory("Classroom", function($resource) {
    return $resource("classrooms/:id", { id: '@id' }, {
        index:  { method: 'GET', isArray: true, responseType: 'json' },
        update: { method: 'PUT', responseType: 'json' }
    });
});

classroomCenter.controller("classroomsController", function($scope, Classroom) {
    $scope.classrooms = Classroom.index()
    $scope.students = []
    for (var i in students) {
        $scope.students.push({"id": students[i].id, "name": students[i].name})
    }
    $scope.courses  = []
    for (var i in courses) {
        $scope.courses.push({"id": courses[i].id, "name": courses[i].name})
    }

    $scope.addClassroom = function() {
        classroom = Classroom.save($scope.newClassroom)

        $scope.classrooms.push(classroom)
        $scope.newClassroom = {}
    }

    $scope.deleteClassroom = function(index) {
        classroom = $scope.classrooms[index]
        Classroom.delete(classroom)
        $scope.classrooms.splice(index, 1);
    }
});
