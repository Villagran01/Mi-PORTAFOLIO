$(function() {
  const experiences = [

    {
        title: 'Web App con Spring Boot (Abr 2025)',
        desc: 'Backend en Java y frontend HTML/CSS para gestión de usuarios y roles.'
    },
    {
        title: 'Desarrollador Full Stack Java (En formación, 2025)',
        desc:'Desarrollo de aplicaciones web utilizando Spring Boot, HTML, CSS, JavaScript, Bootstrap y conexión con bases de datos. Enfocado en CRUD, autenticación y gestión de roles de usuario.'
    },
    {
        title:'Landing Page con Bootstrap (Jun 2025)',
        desc :'Creación de sitio responsivo con diseño moderno utilizando Bootstrap 5, HTML5, CSS3 y eventos con JavaScript.'
    },
    {
        title:'Automatización con VBA en Excel (Jun 2025)',
        desc: 'Desarrollo de macros para validar datos y generar reportes automáticos, facilitando tareas repetitivas y mejorando la eficiencia.'
    },
    {
        title:'Ayudantía en Física Mecánica I y II (2014)',
        desc:'Apoyo académico a estudiantes de Fonoaudiología en ramos de Física en la Universidad Austral de Chile, reforzando conceptos teóricos y resolución de problemas.'
    },
    {
        title:'Modelo MRP para TELCOM (1er Semestre 2014)',
        desc:'Implementación de un sistema de planificación de requerimientos de materiales (MRP) para optimizar la disponibilidad de insumos y la atención al cliente.'
    },
    {
        title:'Optimización con Método Simplex (1er Semestre 2013)',
        desc:'Desarrollo de modelo de investigación de operaciones en Maestranza Manuel Bohadilla para mejorar la toma de decisiones productivas.'
    },
    {
        title:'Soporte Computacional y Hardware (Desde 2008)',
        desc:'Experiencia en mantenimiento de equipos, configuración de software, manejo de Office, AutoCAD y herramientas informáticas para entornos educativos y laborales.'
    }
    // añade más objetos según tu experiencia
  ];
  let expIndex = 0;
  function showNextExperience() {
    if (expIndex >= experiences.length) return;
    const exp = experiences[expIndex];
    const $li = $(`
      <li class="mb-4">
        <h5>${exp.title}</h5>
        <p>${exp.desc}</p>
      </li>
    `).hide();

    $('#experienceList').append($li);
    $li.fadeIn(800, function() {
      expIndex++;
      setTimeout(showNextExperience, 400);
    });
  }
  showNextExperience();


  /* ================================
      2. Botón "Volver arriba"
     ================================ */
  const $btnUp = $('<button id="btnUp" title="Volver arriba">↑</button>')
  .appendTo('body')
  .hide();

  $(window).on('scroll', function() {
  $(this).scrollTop() > 200 ? $btnUp.fadeIn() : $btnUp.fadeOut();
  });

  $btnUp.on('click', function() {
  $('html, body').animate({ scrollTop: 0 }, 500);
  });

});