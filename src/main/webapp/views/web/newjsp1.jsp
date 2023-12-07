<div>
    <select id="city">
        <option value="" selected>Ch?n t?nh thành</option>           
    </select>

    <select id="district">
        <option value="" selected>Ch?n qu?n huy?n</option>
    </select>

    <select id="ward">
        <option value="" selected>Ch?n ph??ng xã</option>
    </select>
</div>    


<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            var opt = document.createElement('option');
            opt.value = x.Name;
            opt.text = x.Name;
            opt.setAttribute('data-id', x.Id);
            citis.options.add(opt);
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if (this.options[this.selectedIndex].dataset.id != "") {
                const result = data.filter(n => n.Id === this.options[this.selectedIndex].dataset.id);

                for (const k of result[0].Districts) {
                    var opt = document.createElement('option');
                    opt.value = k.Name;
                    opt.text = k.Name;
                    opt.setAttribute('data-id', k.Id);
                    district.options.add(opt);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.options[citis.selectedIndex].dataset.id);
            if (this.options[this.selectedIndex].dataset.id != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.options[this.selectedIndex].dataset.id)[0].Wards;

                for (const w of dataWards) {
                    var opt = document.createElement('option');
                    opt.value = w.Name;
                    opt.text = w.Name;
                    opt.setAttribute('data-id', w.Id);
                    wards.options.add(opt);
                }
            }
        };
    }
</script>