part of 'gorevler_cubit.dart';

@immutable
abstract class GorevlerState {}

class GorevlerInitial extends GorevlerState {}

class GorevYuklendi extends GorevlerState {
  GorevTamamlandi() {
    List<Gorev> gorevlistesi = [];
    gorevlistesi.add(Gorev(
        gorevAdi: "Kitap Oku",
        gorevKategorisi: "Kişisel Gelişim",
        gorevNotu: "ertelemeden kitap oku"));
    gorevlistesi.add(Gorev(
        gorevAdi: "Spor yap", gorevKategorisi: "fiziksel gelişim", gorevNotu: "düzenli spor yap"));

    return gorevlistesi;
  }
}

class GorevlerYukenemedi extends GorevlerState {}
