/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
function addToCart(id) {
    let quantity = parseInt(document.querySelector('input[name="quantity"]').value);
    window.location.href = `\addToCart?id=${id}&detail=1&quantity=${quantity}`;
    console.log(id);
    console.log(`\addToCart?id=${id}&detail=1&quantity=${quantity}`);
}

function updateCart() {
    window.location.href='updateCart';
}

