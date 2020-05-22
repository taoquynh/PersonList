#  Hướng dẫn thực hành thêm, sửa, xoá một đối tượng

## Xác định đối tượng
- Đối tượng cần tạo có 3 thuộc tính: ảnh đại diện, tên, số điện thoại
- Như vậy, cần tạo model có 3 properties. Sử dụng struct hoặc class để tạo

## Xác định giao diện (có 2 màn)
- Màn 1: 
    - Màn 1 có navigationBar, có button Add
    - Thân màn có tableView, mỗi dòng của tableView hiển thị ảnh đại diện, tên và số điện thoại của người dùng đó
    - Ảnh đại diện được bo tròn
    
- Màn 2:
    - Màn 2 có navigationBar, có button Save (để lưu thông tin).
    - Thân màn 2 có Label hiển thị nội dung user cần nhập, có TextField để user nhập liệu, có button để mở thư viện lấy ảnh hoặc chụp từ camera, có ImageView để hiển thị ảnh được chọn
    - Sử dụng ImagePickerController để lấy ảnh, sau khi chọn ảnh thì cập nhật vào imageView
    - Để lấy ảnh từ thư viện/camera: tham khảo - https://github.com/taoquynh/ImagePicker

## Logic
- Từ màn 1, thông qua button Add sẽ điều hướng ứng dụng sang màn 2. 
- Ở màn 2, lấy dữ liệu từ người dùng gồm có tên, số điện thoại, ảnh đại diện
- Khai báo 1 closure, tham số là model định nghĩa ban đầu
- Thực hiện truyền dữ liệu từ màn 2 về màn 1 thông qua closure, ngay trước khi back về màn 1
- Ở màn 1, ngay sau vị trí khởi tạo màn 2, thực hiện hứng dữ liệu bằng cách truy cập vào closure của màn 2, cập nhật dữ liệu đó vào mảng lưu dữ liệu (mảng model). Sau đó gọi ```tableView.reloadData()``` để cập nhật dữ liệu lên giao diện

## Nâng cao
- Thực hiện việc sửa, xoá với từng đối tượng
