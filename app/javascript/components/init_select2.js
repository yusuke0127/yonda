import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
      tags: true,
      placeholder: "Add Category   ▾",
      width: '340px'
    });
};

export { initSelect2 };
