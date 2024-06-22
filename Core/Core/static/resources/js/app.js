//------------CARGADOR-------------------
document.addEventListener("DOMContentLoaded", function() {
    setTimeout(function() {
        var loader = document.getElementById('loader');
        var content = document.getElementById('content');
        
        loader.style.display = 'none';
        content.style.display = 'block';
        document.body.style.overflow = 'auto';
    }, 500);
});
//--------------------------------------

