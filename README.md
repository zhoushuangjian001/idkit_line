# idkit_line

This is a convenient development kit for the expansion of the requirements of the dividing line in the development of the Flutter project.

## Use case of the package extension method

- Solid line

  ```dart
    IDKitLine.solid(),
    const SizedBox(height: 20),
    IDKitLine.solid(
        color: Colors.red,
        width: 300,
        height: 5,
        thickness: 3,
    ),
    const SizedBox(height: 20),
    IDKitLine.solid(
        color: Colors.purple,
        width: 300,
        axis: Axis.vertical,
        height: 20,
    )
  ```

- Dotted line
  ```dart
    IDKitLine.dotted(),
    const SizedBox(height: 20),
    IDKitLine.dotted(
        dashLength: 5,
        interval: 3,
        thickness: 3,
    ),
    const SizedBox(height: 20),
    IDKitLine.dotted(
        width: 200,
        color: Colors.purple,
        dashLength: 5,
        interval: 3,
    ),
    const SizedBox(height: 20),
    IDKitLine.dotted(
        dashLength: 5,
        interval: 3,
        dottedType: DottedType.dash_dot,
    ),
    const SizedBox(height: 20),
    IDKitLine.dotted(
        width: 200,
        color: Colors.purple,
        dashLength: 10,
        interval: 3,
        thickness: 4,
        dottedType: DottedType.dash_dot,
    )
  ```
- Wavy line
  ```dart
    IDKitLine.wavy(),
    const SizedBox(height: 20),
    IDKitLine.wavy(
        color: Colors.red,
        width: 300,
    ),
    const SizedBox(height: 20),
    IDKitLine.wavy(
        axis: Axis.vertical,
        height: 200,
        thickness: 4,
        a: 6,
        w: 0.2,
    )
  ```

## Point

If you want to know more about idkitline usage, please go to Github and search idkitline,[Click here for quick access](https://github.com/zhoushuangjian001/idkit_line).
