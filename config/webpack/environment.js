const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Rails: ['@rails/ujs'],
    dragula: ['dragula','default']
  })
)

environment.config.merge({
  output: {
    library: ['Packs', '[name]'], // exports to "Packs.application" from application pack
    libraryTarget: 'var',
  }
})

module.exports = environment
