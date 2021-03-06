var publicAssets = "./public/assets";
var sourceFiles  = "./gulp/assets";
var reactify     = require('reactify');

module.exports = {
  publicAssets: publicAssets,
  browserSync: {
    proxy: 'localhost:3000',
    files: ['./app/views/**']
  },
  sass: {
    src: sourceFiles + "/stylesheets/**/*.{sass,scss}",
    dest: publicAssets + "/stylesheets",
    settings: {
      indentedSyntax: true, // Enable .sass syntax!
      imagePath: '/assets/images', // Used by the image-url helper
      includePaths: require('node-bourbon').includePaths
    }
  },
  images: {
    src: sourceFiles + "/images/**",
    dest: publicAssets + "/images"
  },
  browserify: {
    bundleConfigs: [{
      entries: sourceFiles + '/javascripts/app.jsx',
      transform: [reactify],
      dest: publicAssets + '/javascripts',
      outputName: 'global.js',
      extensions: ['.js','.coffee']
    }]
  }
};
