# Ejercicio 4

## Sistema continuo:
$$
  H(s) = \frac{12500 s}{44 s^2 + 60625 s + 625 * 10^4}
$$

### Polos del sistema continuo:

$$
  s = \frac{- 60625 \pm 625 \sqrt{6593}}{88}
$$

<br><br>

## Transformada Z utilizando la transformación conforme de Euler
$$
  H(z) = \frac{204937500 (1 - z^{-1})}{946162008 z^{-2} - 2886270891 z^{-1} + 2018233883}
$$

<br><br>

$$
  2018233883 y[n] - 2886270891 y[n-1] + 946162008 y[n-2] = 204937500 x[n] - 204937500 x[n-1]
$$

<br><br>

## Transformada Z utilizando la transformación conforme Bilineal
$$
  H(z) = \frac{ 204937500 (z^{-2} - 1)}{937439641 z^{-2} + 3706523032 z^{-1} - 2925333391}
$$

<br><br>

$$
  2925333391 y[n] - 3706523032 y[n-1] - 937439641 y[n-2] = 204937500 x[n] - 409875000 x[n-1] + 204937500 x[n-2]
$$
