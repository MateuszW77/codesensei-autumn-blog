// class Dog {
//   constructor() {
//     this.hungry = false;
//   }
//
//
//   bark() {
//     alert('Hau hau. Hungry: ' + this.hungry);
//   }
// }
//
// var d = new Dog();
// d.bark();

const getWeather = (e) => {
  let weatherElem = document.querySelector('#js-weather');

  setInterval(() => {
    fetch('/weather.json?city=Poznan,pl').then((response) => {
      return response.json();
    }).then((data) => {
      weatherElem.innerHTML = 'Temperatura: ' + Math.round(data.temp_celcius);
    }).catch((err) => {
      console.log(err);
    });
  }, 10000)

}

window.addEventListener('load', getWeather)

window.addEventListener('load', (e) => {
  navElem = document.querySelector('nav');

  navElem.addEventListener('mouseover', (e) => {
    console.log('mouseover');
    navElem.style.opacity = 0.5;
  });
  navElem.addEventListener('mouseout', (e) => {
    console.log('mouseout');
    navElem.style.opacity = 1.0;
  });

})
