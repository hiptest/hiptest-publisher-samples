module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-qunit');
  grunt.loadNpmTasks('grunt-qunit-junit');
  grunt.loadNpmTasks('grunt-contrib-jasmine');

  grunt.initConfig({
    qunit_junit: {
      options: {}
    },

    qunit: {
      all: ['qunit/*.html']
    },

    jasmine: {
      src: ['src/coffee_machine.js', 'jasmine/actionwords.js'],
      options: {
        specs: ['jasmine/project_test.js'],
        junit: {
          path: '_build/test-reports/jasmine',
          consolidate: true
        }
      }
    }
  });
};