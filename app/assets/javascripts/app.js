// Profile Code -------------------

var Profile = Backbone.Model.extend({
	defaults: {
		name: '',
		email: '', 
		work: '',
		story: ''
	}
});

var ProfileView = Backbone.View.extend({
	tagName: 'div',
	template: Handlebars.compile( $("#profileview-template").html() ),
	render: function(){
		this.$el.html( this.template( this.model.attributes ) );
		return this
	}
});

var ProfileCollection = Backbone.Collection.extend({
	url: 'profiles',
	model: Profile,
	initialize: function(){
		this.fetch()
	}
});

var ProfileListView = Backbone.View.extend({
	initialize: function(){
		this.listenTo(this.collection, 'add', this.renderProfile)
	},
	renderProfile: function(profile){
		profile.view = new ProfileView({ model: profile });
		this.$el.prepend( profile.view.render().el );
		return this
	},

});

var ProfileFormView = Backbone.View.extend({

	events:{
		'submit':'submitCallback'
	},
	submitCallback: function(e){
		e.preventDefault();
		var profile_data = this.getFormData();
		this.collection.create(profile_data);
		this.clearForm();
	},
	getFormData: function(){
		var profile_data = {
			name: this.$('#name-field').val(),
			email: this.$('#email-field').val(),
			work: this.$('#work-field').val(),
			story: this.$('#story-field').val()
		};
		return profile_data
	},
	clearForm: function(){
		this.$('input').val('')
	}
});

 // Project Code -----------------------------------------

// Project Model
var Project = Backbone.Model.extend({
	defaults: {
		name: '',
		email: '', 
		title: '',
		description: ''
	}
});

//  Project View
var ProjectView = Backbone.View.extend({
	// tagName
	tagName: 'div',
	//template
	template: Handlebars.compile( $("#projectview-template").html() ),

	// render
	render: function(){
		this.$el.html( this.template( this.model.attributes ) );
		return this
	}
});
// collection
var ProjectCollection = Backbone.Collection.extend({
	url: 'projects',
	model: Project,
	initialize: function(){
		this.fetch()
	}
});

// Project List View
var ProjectListView = Backbone.View.extend({
	// listener to react to added event
	initialize: function(){
		this.listenTo(this.collection, 'add', this.renderProject)
	},

	//render 1 project to the list
	renderProject: function(project){
		project.view = new ProjectView({ model: project });
		// this.$el.empty();
		this.$el.prepend( project.view.render().el );
		return this
	},

	// Render all
	// render: function(){
	// 	var self = this;
	// 	this.$el.empty();
	// 	_.each(this.collection.models, function(project){
	// 		self.renderProject(project);
	// 	});
	// }
});
// project form View
var ProjectFormView = Backbone.View.extend({
// events?
// getformdata?
// clearform?
// submitCallback?
	events:{
		'submit':'submitCallback'
	},
	submitCallback: function(e){
		e.preventDefault();
		var project_data = this.getFormData();
		this.collection.create(project_data);
		this.clearForm();
	},
	getFormData: function(){
		var project_data = {
			name: this.$('#name-field').val(),
			email: this.$('#email-field').val(),
			title: this.$('#title-field').val(),
			description: this.$('#description-field').val()
		};
		return project_data
	},
	clearForm: function(){
		this.$('input').val('')
	}
});





//Project Variables & Profile Variables
var project_collection, project_list_view, project_form;
var profile_collection, profile_list_view, profile_form_view;

function eventHandlers() {
	$('#profile-button').on('click', function(e) {
		$('#profile-form').fadeIn(700).css({display:'block'});
		$('#profile-form').fadeIn(700).css({display:'none'});
	});
	$('#project-button').on('click', function(e){
		$('#project-form').fadeIn(700).css({display:'block'});
		$('#project-form').fadeIn(700).css({display:'none'});
	});
	$('#about-button').on('click', function(e){
		$('#about-info').fadeIn(700).css({display:'block'});
		$('#about-info').fadeIn(700).css({display:'none'});
	});
}

$(function(){
	eventHandlers();
	profile_collection = new ProfileCollection();
	profile_list_view = new ProfileListView({collection: profile_collection, el: $('#profile-list')});
	profile_form_view = new ProfileFormView({collection: profile_collection, el: $('#profile-form')})

	project_collection = new ProjectCollection();
	project_list_view = new ProjectListView({collection: project_collection, el: $('#project-list')});
	project_form_view = new ProjectFormView({collection: project_collection, el: $('#project-form')})

});