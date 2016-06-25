$('button').click(function(){
    $(this).text(function(i,old){
        return old=='Mostrar spoiler!' ?  'Ocultar spoiler' : 'Mostrar spoiler!';
    });
});