const generateOffer = () => {
  const offerBtns = document.querySelectorAll('.offer-btn');
  offerBtns.forEach((btn) => {
    btn.addEventListener('click', (e) => {
      const id = e.currentTarget.id;

      const modal = document.getElementById('modal'.concat(id));
      modal.classList.remove('d-none');

      const exit = document.getElementById('exit'.concat(id));
      exit.addEventListener('click', (e) => {
        modal.classList.add('d-none');
      });
    });
  });
};


export { generateOffer };
