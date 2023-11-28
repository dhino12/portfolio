let itemSlider = null;
let product_page = null;
let l = 0;
let movePer = 25.34;

const right_mover = (contentRef) => {
    itemSlider = contentRef.current.querySelectorAll('#item-slide');
    product_page = Math.ceil(itemSlider.length/4);
    
	l = l + movePer;
	if (itemSlider.length == 1){l = 0; return }
	if (l >= (movePer * itemSlider.length)) return
    
	for(const i of itemSlider)
	{
		i.style.left = '-' + l + '%';
	}
}

const left_mover = (contentRef) => {
    itemSlider = contentRef.current.querySelectorAll('#item-slide');
    product_page = Math.ceil(itemSlider.length / 4);

    l = l - movePer;
	if (l <= 0) { l = 0; }
	for(const i of itemSlider){
		if (product_page >= 1){
			i.style.left = '-' + l + '%';
		}
	}
}

export { right_mover, left_mover }