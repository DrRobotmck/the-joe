$(function(){
	searchDrinks();
	getWords( addList );
	smooveScroll();
})

function searchDrinks(){
	var searchBar = $("form.drinks");
	searchBar.submit(function(event){
		event.preventDefault();
		var term = searchBar.find("input[name='drink-search']").val();
		getWords(function(drinks){
			var regex = new RegExp(term, 'gi')
			_.each(drinks, function(drink){
				if (drink.name.match(regex)){
					smooveScroll();
					window.location.replace("/drinks#"+drink.id);
				}
			})
		}, this);
	})
}

function getWords(callback){
	$.getJSON("/drinks", callback);
}

function addList(drinks){
	var wordDiv = $("div.wordlist");
	_.each(drinks, function(drink){
		var word = $("<p class='word'>");
		var link = $("<a class='drink-link' href='#"+drink.id+"'>").html(drink.name);
		word.html(link);
		wordDiv.append(word);
		var def = $("div.definition");
		var title = $("<h3 id="+drink.id+" class='def'>").text(drink.name);
		var definition = $("<p class='def'>").text(drink.definition);
		def.append(title).append(definition);
	 	// wordDiv.prependTo($("div.container"));
	 });
}

function smooveScroll(){
	$(function() {
		$('a[href*=#]:not([href=#])').click(function() {
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top
					}, 1000);
					return false;
				}
			}
		});
	});
}

