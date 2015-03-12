module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-qunit');
  grunt.loadNpmTasks('grunt-qunit-junit');

  grunt.initConfig({
    qunit_junit: {
      options: {}
    },

    qunit: {
      all: ['qunit/*.html']
    }
  });
};