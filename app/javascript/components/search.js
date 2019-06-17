const searchPlayer = () => {
  const input = document.getElementById('keyword');
  const playerInfo = document.querySelectorAll('player-info');
  const playerSlates = document.querySelectorAll('.player-slate');
  input.addEventListener('keyup', (e) => {
    let keyword = e.currentTarget.value;

    playerSlates.forEach((slate) => {
      slate.classList.add('d-none');
    });
  });
};

export { searchPlayer };


