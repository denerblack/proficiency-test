var classroomCenter = angular.module('ClassroomCenter', ['ngResource']);

classroomCenter.factory("Classroom", function($resource) {
    return $resource("classrooms/:id", { id: '@id' }, {
        index:  { method: 'GET', isArray: true, responseType: 'json' },
        update: { method: 'PUT', responseType: 'json' }
    });
});

classroomCenter.controller("classroomsController", function($scope, Classroom) {
    $scope.classrooms = Classroom.index()
    console.log(Classroom.index())
//    $scope.students = students
//    $scope.courses  = courses

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
