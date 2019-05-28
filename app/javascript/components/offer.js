const generateOffer = () => {
  const offerBtns = document.querySelectorAll('.offer-btn');
  offerBtns.forEach((btn) => {
    btn.addEventListener('click', (e) => {
      const id = e.currentTarget.id;

      const modal = document.getElementById('modal'.concat(id));
      modal.classList.remove('d-none');

      const create = document.getElementById('create'.concat(id));
      create.addEventListener('click', (e) => {
        modal.classList.add('d-none');
      });

      const cancel = document.getElementById('cancel'.concat(id));
      cancel.addEventListener('click', (e) => {
        modal.classList.add('d-none');
      });
    });
  });
};


export { generateOffer };
