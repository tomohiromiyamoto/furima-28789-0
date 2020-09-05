window.addEventListener('DOMContentLoaded', function() {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const buy_button = document.getElementById('buy-red-btn');

  buy_button.addEventListener('click', function(e) {
    e.preventDefault();
    const card = {
      number: document.getElementById('number').value,
      exp_month: document.getElementById('exp_month').value,
      exp_year: `20${document.getElementById('exp_year').value}`,
      cvc: document.getElementById('cvc').value
    };
    Payjp.createToken(card, (status, response) => {
      if ( status === 200 ) {
        const token = response.id;
        const input = `<input value=${token} type='hidden' name='token'>`;
        const html = document.getElementById('charge-form');
        html.insertAdjacentHTML('beforeend', input );
        document.getElementById('number').removeAttribute('name');
        document.getElementById('exp_month').removeAttribute('name');
        document.getElementById('exp_year').removeAttribute('name');
        document.getElementById('cvc').removeAttribute('name');
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
    });
  });
})