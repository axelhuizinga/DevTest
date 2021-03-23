//
// Configuration:
// This configuration is still relatively minimalistic;
// each section has many more options
//
module.exports = () =>{
	// context: __dirname,
	console.log(process.env.LANG);
	console.log('build:'+ process.env.build);	
	//const buildTarget = process.env.build || 'dev';
	//const localConf = require('./webpack.local')(process.env);
	const devHost = 'localhost';
	const fs = require('fs');
	const path = require('path');
	
	const buildMode = process.env.build || 'development';
	
	const isProd = buildMode !== 'development';
	
	const sourcemapsMode = isProd ? undefined :'cheap-module-source-map' ;
	// Plugins
	//console.log(process.env);
	const webpack = require('webpack');
	const HtmlWebpackPlugin = require('html-webpack-plugin');
	const MiniCssExtractPlugin = require('mini-css-extract-plugin');
	// Options
	const debugMode = buildMode !== 'production';
	const dir = __dirname;
	const dist = path.join(__dirname, "/../httpdocs");
	//const dist = path.resolve(__dirname, "./httpdocs");
	console.log('Output Directory:' + dist);
	console.log(`projectDirectory:${dir} isProd:`+ isProd +  ` debugMode:${debugMode}`);
	
	return {
		//module.exports = {
		// List all the JS modules to create
		// They will all be linked in the HTML page
		entry: {
			app: './build.hxml'
		},
	//"info-verbosity":'verbose',
		mode: buildMode,
		// Generation options (destination, naming pattern,...)
		output: {
			path: dist,
			filename: 'js/[name].js',
			//publicPath: dist,
			publicPath: '/'
		},
		// Module resolution options (alias, default paths,...)
		resolve: {
			modules: [dist, path.resolve(dir, 'res/scss'), 'node_modules'],
			extensions: ['.js', '.json']
		},
		// Sourcemaps option for development
		devtool: sourcemapsMode,
		// Live development server (serves from memory)
		devServer: (process.env.build == 'development'?
			{
				contentBase: dist,
				compress: true,
				host: 'localhost',
				port: 8000,
				overlay: false,
				lazy: false,
				hot:true,
				disableHostCheck: true,
				inline: true,
				headers: {
					//"Access-Control-Allow-Origin": "*",
					"Access-Control-Allow-Credentials":true,
					"Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
					"Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization"
				},	       
				historyApiFallback: {
					index: '/'
				},
				index: 'crm.html',
				staticOptions:{
					index:false
				},
				publicPath: '/',	
				stats: {
					children: true,
					// Add chunk information (setting this to `false` allows for a less verbose output)
					chunks: true,				
					// Add namedChunkGroups information
					chunkGroups: true,				
					// Add built modules information to chunk information
					chunkModules: true,				
					// Add the origins of chunks and chunk merging info
					chunkOrigins: true,
					errorDetails: true,
					entrypoints: true,
					providedExports: true
				}
			}:{}),	
		watch: (isProd ? false: true),
		watchOptions:{
			ignored: ['httpdocs']
		},    
		// List all the processors
		module: {
			rules: [
				// Haxe loader (through HXML files for now)
				{
					test: /\.hxml$/,
					loader: 'haxe-loader',
					options: {					
						debug: debugMode,
						logCommand: true,
						outputPath: 'js/',
						watch: ['.'],
						// Additional compiler options added to all builds                    
						extra: (isProd ? '-D build_mode=' + buildMode : '-D build_mode=' + buildMode + ' -D react_hot'),
					}
				},
				// Static assets loader
				// - you will need to adjust for webfonts
				// - you may use 'url-loader' instead which can replace
				//   small assets with data-urls
				{
					test: /\.(s*)css$/,
					//test: /css$/,
					use: [
						isProd ? 
						{
							loader: MiniCssExtractPlugin.loader,
							options: {
								publicPath: (resourcePath, context) => {
								// publicPath is the relative path of the resource to the context
								// e.g. for ./css/admin/main.css the publicPath will be ../../
								// while for ./css/main.css the publicPath will be ../
								console.log('resourcePath:' + resourcePath);
								console.log('context:' + context);
								console.log('publicPath:' + path.relative(path.dirname(resourcePath), context) + '/');
								return path.relative(path.dirname(resourcePath), context) + '/';
								},
							}
						}: 'style-loader',
						"css-loader",
						'sass-loader'
					]
				},
				{
					test: /\.(ttf|eot|svg|png|woff(2)?)(\?[a-z0-9]+)?$/,
					use: [{
						loader: 'file-loader', options: {name: '.../webfont/[name].[ext]'}
					}]
				}
			]
		},
		optimization: {
			minimize:false,
			splitChunks: {
			cacheGroups: {
				styles: {
				name: 'styles',
				test: /\.(s*)css$/,
				chunks: 'all',
				enforce: true,
				},
			},
			},
		},
		// Plugins can hook to the compiler lifecycle and handle extra tasks
		plugins: [
			new MiniCssExtractPlugin({
				// Options similar to the same options in webpackOptions.output
				// both options are optional
				filename: "css/[name].css",
			}),
			// HMR: enable globally
			//new webpack.HotModuleReplacementPlugin(),
			// HMR: prints more readable module names in the browser console on updates
			new webpack.NamedModulesPlugin(),
			// HMR: do not emit compiled assets that include errors
			new webpack.NoEmitOnErrorsPlugin(),
			// Like generating the HTML page with links the generated JS files  template: resolve(__dirname, 'src/public', 'index.html'),
			new HtmlWebpackPlugin({
				filename: (isProd ? 'index.php' : 'crm.html'),
				template: path.resolve(__dirname, 'res/'+(isProd ? 'crm.php' : 'crm.html')),
				title: 'DevTest'
			})
		]
	}
};